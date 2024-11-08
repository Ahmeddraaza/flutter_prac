import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_prac_1/Models/posts_model.dart';
import 'package:flutter_prac_1/Models/usermodel.dart';
import 'package:http/http.dart' as http;


class Example3 extends StatefulWidget{

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3>{

  List <Usermodel> usermodel = [];



  Future<List<Usermodel>> getUserApi() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    final jsonData = jsonDecode(response.body) as List<dynamic>;

    if (response.statusCode == 200) {
      usermodel = jsonData.map((json) => Usermodel.fromJson(json)).toList();
      return usermodel;
    } else {
      return usermodel;
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Api"),
        backgroundColor: Colors.blueAccent.shade100,
      ),

      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getUserApi(), builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }else if(snapshot.hasError){
                return Center(child: Text('Error: ${snapshot.error}'));
              }else if(snapshot.hasData && snapshot.data!.isNotEmpty){
                return ListView.builder(

                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child:Padding(padding: EdgeInsets.all(10),
                     

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                       
                        
                        children: [
          
                          Text('Name: ${snapshot.data![index].name}', style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
                          Text('Email: ${snapshot.data![index].email}'),
                          Text('Address: ${snapshot.data![index].address!.street}'),
                          Text('Address: ${snapshot.data![index].address!.geo!.lat}')
                        ],
                      ),
                    ),
                    );
                  },
                );
              }else{
                return const Center(child: Text('No Data Found'));
              }
            }),
            
          )
        ]
      ),



    );
    

  }






}