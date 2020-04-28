import 'package:flutter/material.dart';
import 'package:images/src/models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel model) {
     return Container(
      child: Column(
        children: <Widget>[
          Image.network(
            model.url,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 0),
            child: Text(
              model.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
          ),
        ],
      ),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.blue[700],
        ),
      ),
    );
  }
}
