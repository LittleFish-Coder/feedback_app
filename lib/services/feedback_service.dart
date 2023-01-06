import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FeedbackService{

  Future<void> index() async {
    var url = Uri.http('127.0.0.1:5000', '/test', {'q': '{http}'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      debugPrint(response.body);
    } else {
      debugPrint('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<void> sendFeedback(String text) async {
    Uri url = Uri.parse('http://127.0.0.1:5000/feedback');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    Map<String, dynamic> jsonBody = {
      "userName": "testName",
      "gender": "Male",
      "feedback": text,
    };

    var response = await http.post(url, headers: headers, body: jsonEncode(jsonBody));
    if (response.statusCode == 200) {
      debugPrint(response.body);
    } else {
      debugPrint('Request failed with status: ${response.statusCode}.');
    }
  }

}