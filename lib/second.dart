import 'package:flutter/material.dart';
import 'main.dart';

class NameList{
  static List<String> Names = [];
}
class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Widget Template(name) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              )
            )
          ],
        ),
      ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("List of names",
        style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: "Montserrat",),
      ),
    ),
      body: ListView(
        children: NameList.Names.map((name)=>Template(name)).toList(),
      ),
    );
  }
}

