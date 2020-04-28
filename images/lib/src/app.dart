import 'dart:convert' show jsonDecode;
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get, post;
import 'package:images/src/models/image_model.dart';
import 'package:images/src/widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    print("here we go");
    return MaterialApp(
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Image App"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.theaters),
                onPressed: changeTheme,
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: fetchImage,
            child: Icon(Icons.add),
          ),
          body: ImageList(images)),
    );
  }

  void fetchImage() async {
    counter++;
    var response =
        await get("https://jsonplaceholder.typicode.com/photos/$counter");
    // if(response.statusCode != 200){
    //   return;
    // }
    print("Response $response");

    var body = jsonDecode(response.body);
    
    ImageModel model = ImageModel.fromJson(body);
    setState(() {
      images.add(model);
    });
  }

  void changeTheme() {
    setState(() {
      // if(isDark){
      //   isDark=false;
      // }else{
      //   isDark=true;
      // }
      // isDark = isDark ? false : true;
      isDark = !isDark;
    });
    //todo change theme here
  }
}
