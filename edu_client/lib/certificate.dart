import 'package:edu_client/issue.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Certificate {
   int userId;
   int id;
   String name;
   String issueDate;
   String expiryDate;


   Certificate({this.userId, this.id, this.name});

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      userId: json['userId'],
      id: json['id'],
      name: json['title'],
    );
  }

  static Future<Certificate> issue(title) async {
    final response = await http.post('https://jsonplaceholder.typicode.com/albums'
      //final response = await http.post('https://192.168.1.2:8081/issue'

      ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),);
    if (response.statusCode == 201) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Certificate.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future<Certificate> fetch() async{
    final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');
    //final response = await http.post('https://192.168.1.2:8081/list';

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Certificate.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }


}
