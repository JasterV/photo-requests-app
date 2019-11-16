import 'package:flutter/material.dart';
import '../Models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 3.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      child: frame(image),
    );
  }

  Widget frame(ImageModel image) {
    return Column(
      children: <Widget>[
        myImage(Image.network(image.url)),
        Text(image.title),
      ],
    );
  }

  Widget myImage(Image image) {
    return Padding(
      child: image,
      padding: EdgeInsets.only(bottom: 20.0),
    );
  }
}
