import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    Transaction(id: 1, title: 'Laptop', amount: 100000.00, date: DateTime.now()),
    Transaction(id: 2, title: 'Backpack', amount: 3000.00, date: DateTime.now()),
  ];

  final titleController = TextEditingController();
  final priceController = TextEditingController();


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

          // Diagram

          Container(
            padding: EdgeInsets.all(10),

            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Name'
                      ),

                      controller: titleController,
                    ),

                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Price'
                      ),

                      controller: priceController,
                    ),

                    TextButton(
                      child: Text(
                        'Add new transaction',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      onPressed: () {
                        // TODO logic
                        
                      },
                    )
                  ],
                ),
              ),
            )
          ),

          // Column of transactions

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
                          '\u20BD${transaction.amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.deepPurple
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(
                          top: 15,
                          bottom: 15
                        ),

                        child: Column(
                          children: [
                            Container(
                        
                              child: Text(
                                transaction.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                        
                            Container(
                        
                              child: Text(
                                DateFormat('dd MMM, yyyy').format(transaction.date),
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 65, 65, 65)
                                ),
                              ),
                            )
                          ],
                        ),
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