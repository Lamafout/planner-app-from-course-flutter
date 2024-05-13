import 'package:http/http.dart' as http;
import '../classes/transaction.dart';

class PostSend{
  void postData({required Transaction transaction, required Function doSomething}) async{
    var url = Uri.parse('http://localhost:8080/post');
    var data = {
      'title': transaction.title,
      'price': transaction.amount.toString(),
      'date': transaction.date.toString()
    };

    var response = await http.post(
      url,
      body: data
    );

    if (response.statusCode == 200){
      doSomething();
    }
    else{
      print('Error: ${response.statusCode}');
    }
  }
}