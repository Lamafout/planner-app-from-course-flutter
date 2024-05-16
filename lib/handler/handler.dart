import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';
import 'dart:io';

import '../classes/transaction.dart';

class PostSend {
  void postData({required Transaction transaction, required Function doSomething}) async {
    final currentIP = await getDeviceIP();
    var url = Uri.parse('http://' + currentIP + ':8080');
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
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi){
      var wifiIP = await (WifiInfo().getWifiIP());
      return wifiIP ?? '';
    }
    // TODO добавить возможность подключиться к другому айпишнику в случае, если девайс не подключёг к вай-фаю
    else {
      return '';
    }
  }

  // TODO понять, есть ли прок в принципе от айпишки устройства
  Future<String> getDeviceIP() async{
    for (var interface in await NetworkInterface.list()) {
    for (var address in interface.addresses) {
      if (address.type == InternetAddressType.IPv4) {
        return address.address;
      }
    }
  }
  return 'IP-адрес не найден';
  }
}
