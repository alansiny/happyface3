import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happpyface/apicalls/answersent.dart';
import 'package:happpyface/apicalls/questiongen.dart';
import 'package:happpyface/database/questions/questions.dart';

final TextEditingController question1controller = TextEditingController();
final TextEditingController question2controller = TextEditingController();
final TextEditingController question3controller = TextEditingController();
final TextEditingController question4controller = TextEditingController();
final TextEditingController question5controller = TextEditingController();
List<String> answers = [];

class ScreenTest extends StatelessWidget {
  const ScreenTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF1A1A1A,
      ), // Dark background matching home screen
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // Header with gradient
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blueAccent, Colors.lightBlueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.psychology, size: 40, color: Colors.white),
                      const SizedBox(height: 12),
                      Text(
                        "Mood Assessment",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Tell us how you're feeling today",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Question 1
                _buildQuestionCard(
                  questiondata.question1 ?? "Question 1",
                  question1controller,
                  Icons.sentiment_satisfied_alt,
                ),

                // Question 2
                _buildQuestionCard(
                  questiondata.question2 ?? "Question 2",
                  question2controller,
                  Icons.energy_savings_leaf,
                ),

                // Question 3
                _buildQuestionCard(
                  questiondata.question3 ?? "Question 3",
                  question3controller,
                  Icons.favorite,
                ),

                // Question 4
                _buildQuestionCard(
                  questiondata.question4 ?? "Question 4",
                  question4controller,
                  Icons.lightbulb,
                ),

                // Question 5
                _buildQuestionCard(
                  questiondata.question5 ?? "Question 5",
                  question5controller,
                  Icons.star,
                ),

                const SizedBox(height: 30),

                // Submit Button
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blueAccent, Colors.lightBlueAccent],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      submit(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.send, color: Colors.white, size: 24),
                        const SizedBox(width: 12),
                        Text(
                          "Submit Assessment",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard(
    String question,
    TextEditingController controller,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2B2B2B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blueAccent.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.blueAccent, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  question,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: controller,
            maxLines: 3,
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
            decoration: InputDecoration(
              hintText: "Share your thoughts...",
              hintStyle: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14,
              ),
              filled: true,
              fillColor: const Color(0xFF1F1F1F),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.blueAccent,
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ],
      ),
    );
  }
}

void submit(BuildContext context) async {
  answers.clear();

  answers.add(
    question1controller.text.isNotEmpty
        ? question1controller.text
        : "user not answered",
  );
  answers.add(
    question2controller.text.isNotEmpty
        ? question2controller.text
        : "user not answered",
  );
  answers.add(
    question3controller.text.isNotEmpty
        ? question3controller.text
        : "user not answered",
  );
  answers.add(
    question4controller.text.isNotEmpty
        ? question4controller.text
        : "user not answered",
  );
  answers.add(
    question5controller.text.isNotEmpty
        ? question5controller.text
        : "user not answered",
  );

  // Show beautiful loading indicator
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF2B2B2B),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                strokeWidth: 3,
              ),
              const SizedBox(height: 20),
              Text(
                "Analyzing your mood...",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "This may take a moment",
                style: GoogleFonts.poppins(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  try {
    // Await the API call and get the result
    var result = await answerSent(answers);

    // Close loading indicator
    if (context.mounted) Navigator.pop(context);

    // Show beautiful bottom sheet with API result
    if (context.mounted) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
              color: Color(0xFF1A1A1A),
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Handle bar
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Header
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.blueAccent, Colors.lightBlueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.analytics,
                            color: Colors.white,
                            size: 32,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Your Mood Analysis",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Results
                    _buildResultCard(
                      "tirdness",
                      "${100 - (int.tryParse(result.tiredness?.toString() ?? '0') ?? 0)}%",
                      Icons.sentiment_dissatisfied,
                      Colors.red,
                    ),

                    _buildResultCard(
                      "Predicted Mood",
                      result.predictmood ?? 'N/A',
                      Icons.sentiment_satisfied_alt,
                      Colors.orange,
                    ),

                    _buildResultCard(
                      "Anger Level",
                      "Similar to ${result.celebrity ?? 'N/A'}",
                      Icons.local_fire_department,
                      Colors.red,
                    ),

                    _buildResultCard(
                      "Wellness Tip",
                      result.tip ?? 'N/A',
                      Icons.lightbulb,
                      Colors.blue,
                    ),

                    const SizedBox(height: 24),

                    // Close Button
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.blueAccent, Colors.lightBlueAccent],
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          "Got it!",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  } catch (e) {
    // Close loading indicator on error
    if (context.mounted) Navigator.pop(context);

    // Show error dialog
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xFF2B2B2B),
          title: Text("Oops!", style: GoogleFonts.poppins(color: Colors.white)),
          content: Text(
            "Something went wrong. Please try again.",
            style: GoogleFonts.poppins(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "OK",
                style: GoogleFonts.poppins(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      );
    }
  }
}

Widget _buildResultCard(
  String title,
  String value,
  IconData icon,
  Color color,
) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color(0xFF2B2B2B),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: color.withOpacity(0.3), width: 1),
    ),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
