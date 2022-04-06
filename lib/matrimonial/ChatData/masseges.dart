
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:immigration/matrimonial/ChatData/chart_list.dart';



class Masseges extends StatefulWidget {
  String? image;
  String? name;
  String? phone;
  Masseges({Key? key, this.image, this.name, this.phone}) : super(key: key);
  // final int coins;


  @override
  _MassegesState createState() => _MassegesState();
}

class _MassegesState extends State<Masseges> {
  final messageInsert = TextEditingController();
  List<Map> messsages = [];

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery
    //     .of(context)
    //     .size
    //     .width;
    // double height = MediaQuery
    //     .of(context)
    //     .size
    //     .height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leadingWidth: 2.0,
        backgroundColor: const Color(0xffff5275),
        leading: IconButton(icon: const Icon(Icons.arrow_back),
          tooltip: "Cancel and Return to List",
          onPressed: () { Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ChatList()),
          );},
        ),
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage:
              widget.image== ""?const AssetImage('Images/welcome.png'): const NetworkImage('widget.image')as ImageProvider,
            ),
            const Flexible(child: Text('widget.name',style:
            TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),
              overflow: TextOverflow.fade,)),
          ],),
        actions: [
          const SizedBox(width: 5,),
          InkWell(
              onTap: ()async{},
              child: const Padding(
                padding: EdgeInsets.only(right: 15),
                child: CircleAvatar(backgroundColor:Color(0xffff5275),
                  child: Center(child: Icon(Icons.call,

                    color: Colors.white,),),),
              )),
          const SizedBox(width: 5,),
          // InkWell(
          //     onTap: ()async{
          //
          //     },
          //     child: CircleAvatar(backgroundColor:Colors.blueAccent,child: Center(child: Icon(Icons.video_call,color: Colors.white,),),))
        ],
      ),
      body: Column(
        children: <Widget>[
          messsages.isEmpty?Flexible(child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,width: 150,
                  decoration: BoxDecoration(shape: BoxShape.circle,
                      image: DecorationImage(
                        image: widget.image== ""?const AssetImage('welcome.png'): const NetworkImage('widget.image')as ImageProvider,
                      )
                  ),
                ),
                const SizedBox(height: 5,),
                const Flexible(child: Text('Perfect Partner',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),overflow: TextOverflow.fade,)),
                // Text('Follow: 10M',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black54),)
              ],
            ),
          ),)


              :Flexible(
              child: ListView.builder(
                  reverse: true,
                  itemCount: messsages.length,
                  itemBuilder: (context, index) => chat(
                      messsages[index]["message"].toString(),
                      messsages[index]["data"]))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: roundedContainer(),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                GestureDetector(
                  onTap: () {
                    if (messageInsert.text.isEmpty) {
                      print("empty message");
                      //BotToast.showText(text: 'Empty message');
                    } else {
                      setState(() {
                        messsages.insert(0,
                            {"data": 1, "message": messageInsert.text});
                      });
                      //response(messageInsert.text);
                      messageInsert.clear();
                    }
                  },
                  child: const CircleAvatar(
                    backgroundColor: Color(0xffff5275),
                    child: Icon(Icons.send,color: Colors.white,),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15.0,
          )
        ],
      ),
    );
  }

  //for better one i have use the bubble package check out the pubspec.yaml
  Widget roundedContainer (){
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            const SizedBox(width: 8.0),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,

                maxLengthEnforced: true,
                maxLength: 40,
                controller: messageInsert,
                decoration: const InputDecoration(
                  counterText: "",
                  hintText: 'Type a message',
                  border: InputBorder.none,
                ),
              ),
            ),
            const Icon(Icons.attach_file,
                size: 30.0, color: Color(0xffff5275),),
            const SizedBox(width: 8.0),
            const Icon(Icons.camera_alt,
                size: 30.0, color: Color(0xffff5275),),
            const SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }

  Widget chat(String message, int data) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Bubble(
          radius: const Radius.circular(15.0),
          // color: data == 0 ? myColors.blue[500] : Colors.orange[700],
          elevation: 0.0,
          alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
          nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //             CircleAvatar(
                //               backgroundImage:
                //        data== 0?
                //             Container():
                //           (widget.image!=""?NetworkImage(widget.image):const AssetImage('images/business man icon.png')
                // ),
                // ),
                //             ),
                const SizedBox(
                  width: 10.0,
                ),
                Flexible(
                    child: Text(
                      message,
                      style: TextStyle(
                          color: const Color(0xffff5275),fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          )),
    );
  }
}