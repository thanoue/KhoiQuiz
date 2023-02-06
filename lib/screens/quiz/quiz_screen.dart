import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/question_controller.dart';
import 'components/quiz_body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          MaterialButton(
            onPressed: () {
              _questionController.nextQuestion();
            },
            child: const Text("Skip"),
          )
        ],
      ),
      body: const QuizBody(),
    );
  }
}
