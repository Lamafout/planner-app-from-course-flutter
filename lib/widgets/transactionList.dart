import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../classes/transaction.dart';

class TransactionList extends StatelessWidget {
  
  final List<Transaction> transcations;

  TransactionList(this.transcations);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
              children: [
                // create cards with our transactions
                ...transcations.map((transaction)  {
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
    );
  }
}