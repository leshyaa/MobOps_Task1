import 'package:flutter/material.dart';
import 'second.dart';

void main() => runApp(const MaterialApp(
    home: Main(),
  ));

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Home Screen",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat",
          ),
        ),
        centerTitle: true,
      ), 
      body: const SafeArea(child:MyForm(),),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}


class _MyFormState extends State<MyForm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
        children: [const SizedBox(height:20),
        Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
width: 300,
          child: TextFormField(
            initialValue: null,
            decoration: const InputDecoration(
              icon: Icon(
          Icons.person,
      color: Colors.black,
              ),
              border: OutlineInputBorder(),
              labelText: 'Enter Name',
              labelStyle: TextStyle(
                fontFamily: "Montserrat",
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )
      ),
            onSaved: (value) {NameList.Names.add(value!);},
            validator: (value) {
              if (value == null || value.isEmpty){
                return 'Please enter some text';
              }
              else{
                return null;
              }
            }
          ),),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Saved')),);
                    formKey.currentState!.save();
                    formKey.currentState?.reset();
                  }
                  },
                child: const Text(
                    'ADD',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                    ),
                ),
              )
          ),
        ],
      ),
    )]),
        ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SecondScreen()),);
                },
                child: const Text(
                  'SHOW ALL NAMES',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                  ),

                )
            ),
      const SizedBox(height:25.0)],
    );
  }
}

