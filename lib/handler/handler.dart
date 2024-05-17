import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

import '../classes/transaction.dart';

class PostSend {
  void postData({required Transaction transaction, required Function doSomething}) async {
    final currentIP = await getIP();
    var url = Uri.parse('http://$currentIP:8080');
    //10.80.175.187
    
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

  Future<String> getIP() async{
    if (Connectivity().checkConnectivity() == ConnectivityResult.wifi){
      var wifiIP = await WifiInfo().getWifiIP();
      return wifiIP ?? '';
    }
    else return '10.80.175.187';
  }
}
