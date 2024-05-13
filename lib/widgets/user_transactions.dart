import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transactionList.dart';
import '../classes/transaction.dart';

class UserTransactions extends StatefulWidget {


  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final List<Transaction> _userTranscations = [
    Transaction(id: 1, title: 'Laptop', amount: 100000.00, date: DateTime.now()),
    Transaction(id: 2, title: 'Backpack', amount: 3000.00, date: DateTime.now()),
  ];

  void addNewTransaction(String title, double price){
    final transaction = Transaction(
      id: 1, 
      title: title, 
      amount: price, 
      date: DateTime.now());

      setState(() {
        _userTranscations.add(transaction);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(titleController, priceController),
        TransactionList(_userTranscations)
      ],
    );
  }
}