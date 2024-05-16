import 'dart:convert';
import 'package:http/http.dart' as http;
import '../classes/transaction.dart';

class PostSend {
  void postData({required Transaction transaction, required Function doSomething}) async {
    var url = Uri.parse('http://127.0.0.1:8080');
    
    var data = {
      'id': transaction.id.toString(),
      'title': transaction.title,
      'price': transaction.amount.toString(),
      'date': transaction.date.toString()
    };

    var response = await http.post(
      url,
      body: json.encode(data),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      doSomething();
    } else {
      print('Error: ${response.statusCode}');
    }
  }
}
