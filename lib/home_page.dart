import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
          title:const Text("FLutter Demo API 1")  
      ),  
      body: const Center(  
          child:Text("Welcome to Flutter API")  
      ),  
    );  
  }  
}