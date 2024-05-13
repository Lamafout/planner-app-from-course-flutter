import 'package:http/http.dart' as http;

void postData({required String title, required DateTime date, required double price, required Function doSomething}) async{
  var url = Uri.parse('../backend/response.go');
  var data = {
    title: title,
    price: price,
    date: date.toString()
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