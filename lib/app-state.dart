import 'package:app/Model/image_model.dart';
import 'package:app/image_list.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' show get;

class App extends StatefulWidget {
  const App({super.key});

  State<App> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var response = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    var imageModel = ImageModel.fromJason(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: ImageList(images),
          appBar: AppBar(
            title: const Text('lets see some images'),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: fetchImage,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
