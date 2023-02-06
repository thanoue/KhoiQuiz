import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../controllers/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // WebsafeSvg.asset('assets/icons/bg.svg', fit: BoxFit.fill),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Spacer(
              flex: 5,
            ),
            Text(
              "Score",
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: kSecondaryColor),
            ),
            Spacer(),
            Text(
                "${_questionController.numOfCorrectAns * 10}/${_questionController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor)),
            Spacer(
              flex: 5,
            ),
          ]),
        ],
      ),
    );
  }
}
