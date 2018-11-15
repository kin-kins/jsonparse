import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main() async
{
  List _data=await getJson();
  print(_data[0]);
  runApp(new MaterialApp(
    title: "JsonParser",
    debugShowCheckedModeBanner: false,
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Json Parser"
        ),backgroundColor: Colors.deepPurpleAccent,
      ),
      body: new Center(
        child: new ListView.builder(
            itemCount: _data.length,
            padding: const EdgeInsets.all(15.0),
            itemBuilder: (BuildContext, int position)
            {
              return Column(
                children: <Widget>[
                  new Divider(height: 5.0,),
                  new ListTile(
                    title: Text("${_data[position]['name']}")
                  )
                ],
              );
            }
      )
    )
  )
  )
  );
}

Future<List> getJson() async
{
String apiUrl="https://jsonplaceholder.typicode.com/users";
http.Response response= await http.get(apiUrl);
return jsonDecode(response.body);
}