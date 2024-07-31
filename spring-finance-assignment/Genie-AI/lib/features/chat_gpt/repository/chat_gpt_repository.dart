import 'package:http/http.dart' as http;
import 'package:genie/constant/string_constant.dart';
import 'dart:convert';

class ChatGptRepository {
  Future<String> generateResponse(String prompt) async {
    var url = Uri.https("api.openai.com", "/v1/completions");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${StringConstant.testKey}'
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo-instruct",
        "prompt": prompt,
        'temperature': 0,
        'max_tokens': 2000,
        'top_p': 1,
        'frequency_penalty': 0.0,
        'presence_penalty': 0.0,
      }),
    );

    // Do something with the response
    Map<String, dynamic> newResponse = jsonDecode(response.body);
    return newResponse['choices'][0]['text'];
  }
}
