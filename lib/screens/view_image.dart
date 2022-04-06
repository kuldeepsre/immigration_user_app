import 'package:flutter/material.dart';

class ViewImage extends StatelessWidget {
  final String image;
  const ViewImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InteractiveViewer(
        minScale: 0.5,
        maxScale: 10,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.contain)),
        ),
      ),
    );
  }
}
