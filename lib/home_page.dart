import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo_api_1/model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Welcome> welcome = [];

  @override  
  Widget build(BuildContext context) {  
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if(snapshot.hasData){

          return ListView.builder(
          itemCount: welcome.length,
          itemBuilder: (context, index) {
            return Container(
              height: 130,
              color: Colors.greenAccent,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('user id: ${welcome[index].userId}', style: const TextStyle(fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold,),),
                  Text('id:  ${welcome[index].id} ', style: const TextStyle(fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold,),),
                  Text('titile:  ${welcome[index].title}',maxLines: 1, style: const TextStyle(fontSize: 14, color: Colors.red),),
                  Text('body:  ${welcome[index].body} ',maxLines: 1, style: const TextStyle(fontSize: 14, color: Colors.red),),
                ],
              ),
            );
          }
        );

        }
        else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        
      }
    );  
  }  

  Future<List<Welcome>> getData() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map<String, dynamic> index in data){
        welcome.add(Welcome.fromJson(index));
      }
      return welcome;

    }
    else{
      return welcome;
    }
  } 
}