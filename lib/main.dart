import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(Cuarto());

class Cuarto extends StatelessWidget {
  const Cuarto({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cuarto",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final String url = "https://jsonplaceholder.typicode.com/posts";
  List data;
  Future<String> getData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "Application/json"});

    data = json.decode(response.body);
    print(data[1]["title"]);
    return "success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tocuar de pollo"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Obtener datos"),
          onPressed: () {
            var t = DateTime.now();
            print(t);
            getData();
          },
        ),
      ),
    );
  }
}