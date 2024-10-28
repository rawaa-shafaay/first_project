import 'package:app/Model/image_model.dart';
import 'package:flutter/widgets.dart';

class ImageList extends StatelessWidget {
  const ImageList(this.images, {super.key});

  final List<ImageModel> images;

  Widget build(context) {
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, int index) {
          return Container(
              decoration: BoxDecoration(border: Border.all()),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.network(images[index].url),
                  ),
                  Text(images[index].title),
                ],
              ));
        });
  }
}
