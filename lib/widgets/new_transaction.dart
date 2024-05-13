import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final TextEditingController titleController;
  final TextEditingController priceController;

  NewTransaction(this.titleController, this.priceController);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              )
              )
              );
  }
}