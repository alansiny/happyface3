import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:happpyface/Screens/introscreen.dart';
import 'package:happpyface/database/questions/questions.dart';
import 'package:happpyface/database/result/result.dart';
import 'package:http/http.dart' as http;

late Result resultdata;

Future<Result> answerSent(List<String> answer) async {
  final apiKey = "";

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
              "You are an emotional state analysis assistant. You will receive exactly 5 answers from a user in response to 5 mood detection questions. Your tasks are: 1) Analyze the answers and estimate the user's tiredness level as a percentage out of 100 (integer only, no decimals), 2) Predict the user's next likely emotional state in one short phrase, 3) Compare their current emotional profile to a celebrity who is famous for being angry, 4) Provide one clear tip to help the user become more angry (this can be humorous but must not promote harmful or dangerous actions). Return only a valid JSON object with exactly these keys: \"tiredness\" → string containing the tiredness percentage, \"predictmood\" → string containing the predicted mood, \"celebrity\" → string with the celebrity name, \"tip\" → string containing the tip. Do not include any explanations, formatting, markdown, or extra text outside of the JSON.",
        },
        {"role": "user", "content": answer.join("\n")},
      ],
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    final content = data['choices'][0]['message']['content'];
    final bodyjson = jsonDecode(content) as Map<String, dynamic>;
    final resultdata = Result.fromJson(bodyjson);
    print("the prediced mood is ${resultdata.predictmood}");
    return resultdata;
  } else {
    throw Exception("Failed to fetch: ${response.body}");
  }
}
