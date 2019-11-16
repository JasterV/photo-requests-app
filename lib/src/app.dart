import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'widgets/image_list.dart';
import 'Models/image_model.dart';
import 'dart:convert';

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> images = [];

  Widget _imageButton(){
    return FloatingActionButton(
      child: Icon(Icons.add_a_photo),
      tooltip: 'Add a photo',
      onPressed:_fetchImage,
      splashColor: Colors.blueAccent,
      backgroundColor: Colors.green,
    );
  }

  void _fetchImage() async {
      counter++;
      final Response response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
      final ImageModel imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green),
      home: Scaffold(
        floatingActionButton: _imageButton(),
        appBar: AppBar(
          title: Text("Let's see images!"),
        ),
        body: Center(
          child: ImageList(images),
        ),
      ),
    );
  }
}