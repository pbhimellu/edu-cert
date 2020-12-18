import 'package:edu_client/issue.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Certificate {
   String userId;
   String id;
   String name;
   String issueDate;
   String expiryDate;


   Certificate({this.userId, this.id, this.name,this.issueDate,this.expiryDate});

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      //userId: json['userId'],
      //id: json['id'],
      //name: json['title'],
      userId: json['issuer'],
      id: json['paperNumber'],
      name: json['owner'],// TODO change the name parameter at backend
      issueDate: json['issueDateTime'],
      expiryDate: json['maturityDateTime'],
    );
  }

                //futureCert = Certificate.issue(_id, _name,_issueDate ,_validTill);
  static Future<Certificate> issue(id, name,issueDate ,validTill ) async {
    //final response = await http.post('https://jsonplaceholder.typicode.com/albums'
      //final response = await http.post('https://192.168.1.100:8081/issue'
    final response = await http.post('http://35.232.15.175:8081/issue'

      ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'name': name,
	'issueDate':issueDate, 
	'validTill':validTill
      }),);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Certificate.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album,body='+ response.body);
    }
  }

  static Future<Certificate> fetch() async{
    //final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');
    final response = await http.get('http://35.232.15.175:8081/list');

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
