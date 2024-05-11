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
                        child: Text(
                          transaction.amount.toString()
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: [
                          Container(
                            child: Text(
                              transaction.title
                            ),
                          ),

                          Container(
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