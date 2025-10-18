import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({required this.summaryData, super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    const Color correctColor = Colors.blue;
    const Color incorrectColor = Colors.red;

    return Center(
      child: SizedBox(
        width: 500,
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map((data) {
              final Color indexColor =
                  data["user_answer"] == data["correct_answer"]
                  ? correctColor
                  : incorrectColor;
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: indexColor,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          ((data["question_index"] as int) + 1).toString(),
                          style: GoogleFonts.comicNeue(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data["question"] as String,
                              style: GoogleFonts.comicNeue(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            data["user_answer"] == data["correct_answer"]
                                ? const SizedBox()
                                : Text(
                                    data["user_answer"] as String,
                                    style: GoogleFonts.comicNeue(
                                      color: incorrectColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            Text(
                              data["correct_answer"] as String,
                              style: GoogleFonts.comicNeue(
                                color: correctColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
