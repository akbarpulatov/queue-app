import 'dart:convert' as convert;
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/history.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  HttpRequest();

  void getHttp() async {
    var url = MyUrls.historyCreatedList;

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    // print(response.body);

    if (response.statusCode == 200) {
      print('==================== status is ok! ==================== ');

      var createdListJson = convert.jsonDecode(response.body) as List;
      createdList =
          createdListJson.map((e) => CreatedItem.fromJson(e)).toList();

      for (var i = 0; i < createdList.length; i++) {
        print(createdList[i].uID);
        print(createdList[i].status);
        print(createdList[i].name);
        print(createdList[i].averageWaitingTime);
        print(createdList[i].bookedTime);
        print(createdList[i].numberOfPeopleInQueue);
      }
    } else {
      print('status is NOTok!');
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

var httpRequest = new HttpRequest();
