import 'package:flutter/material.dart';

import './transaction.dart';

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

  final List<Transaction> transactions = [
    Transaction(id: 1, title: 'Laptop', amount: 100000, date: DateTime.now()),
    Transaction(id: 2, title: 'Backpack', amount: 3000, date: DateTime.now()),
  ];

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
          Column(
            children: [
              // create cards with our transactions
              ...transactions.map((transaction)  {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border(
                            left: BorderSide(
                              width: 3,
                              color: Colors.deepPurple
                            ),
                            top: BorderSide(
                              width: 3,
                              color: Colors.deepPurple
                            ),
                            right: BorderSide(
                              width: 3,
                              color: Colors.deepPurple
                            ),
                            bottom: BorderSide(
                              width: 3,
                              color: Colors.deepPurple
                            )
                          )
                        ),

                        child: Text(
                          transaction.amount.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.deepPurple
                          ),
                        ),
                      ),

                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 10),

                            child: Text(
                              transaction.title
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 10),

                            child: Text(
                              transaction.date.toString()
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              })
            ],
          )
        ],),
    );
  }
}