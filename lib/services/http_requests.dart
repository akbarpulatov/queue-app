import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HttpRequest {
  HttpRequest();

  void getHttp() async {
    var url = 'http://192.168.233.211:3000/history-created';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      print('status is ok!');
      // var jsonResponse = convert.jsonDecode(response.body);

      // var id = jsonResponse['id'];
      // String title = jsonResponse['title'] as String;

      // print('ID of the request is $id');
      // print('Title of the request is: $title');
    } else {
      print('status is NOTok!');
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

var httpRequest = new HttpRequest();
// httpRequest.getHttp();
