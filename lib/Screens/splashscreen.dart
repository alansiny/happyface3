import 'package:flutter/material.dart';
import 'package:happpyface/apicalls/questiongen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    _callChatGPT();
  }

  Future<void> _callChatGPT() async {
    final printresult = await generateQuestions("Say hello", context);
    // print(printresult.question1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset('lib/image/logo.png')));
  }
}
