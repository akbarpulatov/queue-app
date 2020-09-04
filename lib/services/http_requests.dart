import 'dart:convert' as convert;
import 'package:flutter_auth/model/history.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  HttpRequest();

  void getHttp() async {
    var url = 'http://192.168.233.211:3000/history-created';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    // print(response.body);

    if (response.statusCode == 200) {
      print('==================== status is ok! ==================== ');

      var createdListJson = convert.jsonDecode(response.body) as List;
      createdList =
          createdListJson.map((e) => CreatedItem.fromJson(e)).toList();
      print(createdList[0].bookedTime);
    } else {
      print('status is NOTok!');
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

var httpRequest = new HttpRequest();
