
import 'package:flutter/material.dart';
import 'package:server/model/post_model.dart';
import 'package:server/service/http_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var post = Post(id: 1,salary: "PDP",age: "23",name: "test");
    _apiPostDelete(post);
  }

  void _apiPostList(Post post){
    Network.GET(Network.API_EMP_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response),
    });
  }




  void _apiPostCreate(Post post){
    Network.POST(Network.API_EMP_CREATE, Network.paramsCreate(post)).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _apiPostUpdate(Post post){
    Network.PUT(Network.API_EMP_UPDATE + post.id.toString(), Network.paramsUpdate(post)).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _apiPostDelete(Post post){
    Network.DEL(Network.API_EMP_DELETE + post.id.toString(), Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _showResponse(String response){
    setState(() {
      data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data : "No Data"),
      ),
    );
  }
}