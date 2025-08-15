import 'package:flutter/material.dart';
import 'package:happpyface/Screens/screen_about.dart';

import 'package:happpyface/Screens/screen_home.dart';
import 'package:happpyface/Screens/screen_test.dart';

ValueNotifier<int> indexnotifier = ValueNotifier(0);

final screenlist = [ScreenHome(), ScreenTest(), ScreenAbout()];

class introscreen extends StatelessWidget {
  const introscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexnotifier,
        builder: (BuildContext ctx, int value, Widget? child) {
          return screenlist[value];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: indexnotifier,
        builder: (context, value, _) {
          return BottomNavigationBar(
            backgroundColor: Color(0xFF1F1F1F),
            type: BottomNavigationBarType.fixed,
            currentIndex: value,
            onTap: (newIndex) {
              indexnotifier.value = newIndex;
            },

            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey.shade400,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.quiz), label: "Exam"),
              BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
            ],
          );
        },
      ),
    );
  }
}
