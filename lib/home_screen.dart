import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_prac_1/Models/posts_model.dart';
import 'package:http/http.dart' as http;





class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  List<PostsModel> postsList = [];


  Future <List<PostsModel>> getPostApi() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var data = jsonDecode(response.body.toString()) as List<dynamic>;
  if(response.statusCode == 200) {
    for(Map<String, dynamic> i in data){
      postsList.add(PostsModel.fromJson(i));
    }
    return postsList;
  } else {

    return postsList;

    
  }
}









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade100,
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<PostsModel>>(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Title:\n" + postsList[index].title.toString()),
                            Text("Description:\n" +postsList[index].body.toString()),
                          ],
                        ),
                        
                  
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
  
}


