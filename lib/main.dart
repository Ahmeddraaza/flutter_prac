import 'package:flutter/material.dart';
import 'package:flutter_prac_1/example_2.dart';
import 'package:flutter_prac_1/example_3.dart';
import 'package:flutter_prac_1/home_screen.dart';
import 'package:flutter_prac_1/signup.dart';


void main() {
  runApp(flutterapp());
}




class flutterapp extends StatelessWidget{


  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Signup(),
    );
  }

}

class DashboardScreen extends StatelessWidget{    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade100,
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blueAccent.shade700,
        child: Center(
          child: GestureDetector(
            onTap: () {
              print('container clicked');
            },
            child: Container(
              width: 200,
              height: 200,
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                  width: 2  
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]
                

              ),
              
            )
          ),
          
        )
        ),
      );
    
  }
  
}








class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {


    var namees =["hero","khizar","khizra"];
   
    return Scaffold(
      appBar: AppBar(
    
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    
        title: Text(widget.title),
      ),
    body: ListView.separated(itemBuilder:(context, index ){
      return Column(
        children: [
        Text(namees[index], style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
        Text(namees[index], style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
        Text(namees[index], style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),)]
      );
      
    },
 
    itemCount: namees.length,
    separatorBuilder: (context,index){
      return Divider(thickness: 2, height: 100,);
    },
  
    )
    );
  }
}
