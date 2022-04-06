import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:immigration/matrimonial/ChatData/chart_list.dart';
import 'package:immigration/matrimonial/ChatData/masseges.dart';
import 'package:immigration/matrimonial/Constants/const.dart';
import 'package:immigration/matrimonial/Post/post_view.dart';
import 'package:immigration/matrimonial/Screens/Plans/plans.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    getCurrentLocAndAddress();
    super.initState();
  }

  var getaddress;
  var finalAddress;
  getCurrentLocAndAddress() async {
    Position position = await _getGeoLocationPosition();
    GetAddressFromLatLong(position);
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];

    getaddress =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      finalAddress = getaddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              //physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,

              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: kRedColor,
                      size: 30,
                    ),
                    const SizedBox(width: 5),
                    OutlinedButton(
                      onPressed: null,
                      child: const Text(
                        'Latest 100',
                        style: TextStyle(
                            color: Color(0xffff5275),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                    const SizedBox(width: 5),
                    OutlinedButton(
                      onPressed: null,
                      child: const Text(
                        'Near me',
                        style: TextStyle(
                            color: Color(0xffff5275),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                    const SizedBox(width: 5),
                    OutlinedButton(
                      onPressed: null,
                      child: const Text(
                        'My Match',
                        style: TextStyle(
                            color: Color(0xffff5275),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                    const SizedBox(width: 5),
                    OutlinedButton(
                      onPressed: null,
                      child: const Text(
                        'Recently Viewed',
                        style: TextStyle(
                            color: Color(0xffff5275),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                    const SizedBox(width: 5),
                    OutlinedButton(
                      onPressed: null,
                      child: const Text(
                        'Recently Visitor',
                        style: TextStyle(
                            color: Color(0xffff5275),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                    const SizedBox(width: 5),
                    OutlinedButton(
                      onPressed: null,
                      child: const Text(
                        'Interest Received',
                        style: TextStyle(
                            color: Color(0xffff5275),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                    const SizedBox(width: 5),
                    OutlinedButton(
                      onPressed: null,
                      child: const Text(
                        'Interest Accept',
                        style: TextStyle(
                            color: Color(0xffff5275),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                    const SizedBox(width: 5),
                    OutlinedButton(
                      onPressed: null,
                      child: const Text(
                        'Interest Sent',
                        style: TextStyle(
                            color: Color(0xffff5275),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(

            children: [
              PostView(),
            ],
          ),
        ));
  }

  cutomWidget(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ListView(shrinkWrap: true, children: [
      SizedBox(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          //physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,

          children: [
            Row(
              children: [
                OutlinedButton(
                  onPressed: null,
                  child: const Text(
                    'Latest 100',
                    style: TextStyle(
                        color: Color(0xffff5275),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                ),
                const SizedBox(width: 5),
                OutlinedButton(
                  onPressed: null,
                  child: const Text(
                    'Near me',
                    style: TextStyle(
                        color: Color(0xffff5275),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                ),
                const SizedBox(width: 5),
                OutlinedButton(
                  onPressed: null,
                  child: const Text(
                    'My Match',
                    style: TextStyle(
                        color: Color(0xffff5275),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                ),
                const SizedBox(width: 5),
                OutlinedButton(
                  onPressed: null,
                  child: const Text(
                    'Recently viewed',
                    style: TextStyle(
                        color: Color(0xffff5275),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                ),
                const SizedBox(width: 5),
                OutlinedButton(
                  onPressed: null,
                  child: const Text(
                    'Recently Visitor',
                    style: TextStyle(
                        color: Color(0xffff5275),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                ),
                const SizedBox(width: 5),
                OutlinedButton(
                  onPressed: null,
                  child: const Text(
                    'Interest Received',
                    style: TextStyle(
                        color: Color(0xffff5275),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                ),
                const SizedBox(width: 5),
                OutlinedButton(
                  onPressed: null,
                  child: const Text(
                    'Interest accepted',
                    style: TextStyle(
                        color: Color(0xffff5275),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                ),
                const SizedBox(width: 5),
                OutlinedButton(
                  onPressed: null,
                  child: const Text(
                    'Interest Sent',
                    style: TextStyle(
                        color: Color(0xffff5275),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      PostView()
    ]);
  }
}
