import 'dart:convert' as convert;
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/history.dart';
import 'package:flutter_auth/model/queue.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  HttpRequest();

  void getHttp(String url) async {
    // var url = MyUrls.historyCreatedList;

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    // print(response.body);

    if (response.statusCode == 200) {
      print('==================== status is ok! ==================== ');

      if (url == MyUrls.historyCreatedList) {
        var createdListJson = convert.jsonDecode(response.body) as List;
        createdList =
            createdListJson.map((e) => CreatedItem.fromJson(e)).toList();

        print(createdList.toString());
      } else if (url == MyUrls.historyBookedList) {
        print('History booked list is requested!');
        var bookedListJson = convert.jsonDecode(response.body) as List;
        bookedList = bookedListJson.map((e) => BookedItem.fromJson(e)).toList();

        print(bookedList.toString());
      } else if (url == MyUrls.queueList) {
        print('Queue list is requested!');
        var queueListJson = convert.jsonDecode(response.body) as List;
        queueList =
            queueListJson.map((e) => QueueListItem.fromJson(e)).toList();

        print(queueList.toString());
      }
    } else {
      print('status is NOTok!');
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

var httpRequest = new HttpRequest();
