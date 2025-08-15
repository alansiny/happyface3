import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:happpyface/Screens/introscreen.dart';
import 'package:happpyface/database/questions/questions.dart';
import 'package:http/http.dart' as http;

late Questions questiondata;

Future<Questions> generateQuestions(String prompt, BuildContext context) async {
  final apiKey = ""; // Replace with your API key

  final url = Uri.parse("https://api.openai.com/v1/chat/completions");

  final response = await http.post(
    url,
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $apiKey",
    },
    body: jsonEncode({
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "system",
          "content":
              "You are a mood detection question generator.Generate 5 short, clear questions that can help understand the emotional state of a user.Return only a valid JSON object with keys question 1 to question 5 and their respective question text as string values.Do not include any explanations, formatting, or text outside the JSON.",
        },
      ],
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => introscreen()));
    final content = data['choices'][0]['message']['content'];
    final bodyjson = jsonDecode(content) as Map<String, dynamic>;
    questiondata = Questions.fromJson(bodyjson);
    return questiondata;
  } else {
    throw Exception("Failed to fetch: ${response.body}");
  }
}
