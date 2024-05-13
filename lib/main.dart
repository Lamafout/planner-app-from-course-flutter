import 'package:flutter/material.dart';

import './widgets/user_transactions.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 113, 113, 113),
        title: Text(
          'Planner',
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),

      body: Column(
        children: [

          // Header

          Container(
            width: double.infinity,
            child: Text(
              'Header',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),

          UserTransactions()

          ],),
    );
  }
}