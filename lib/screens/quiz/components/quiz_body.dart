import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/controllers/question_controller.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/screens/quiz/components/progress_bar.dart';
import 'package:quiz/screens/quiz/components/question_card.dart';
import 'package:websafe_svg/websafe_svg.dart';

class QuizBody extends StatelessWidget {
  const QuizBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        WebsafeSvg.asset('assets/icons/bg.svg',
            alignment: Alignment.center, width: 900, fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProgressBar(),
                    const SizedBox(height: kDefaultPadding),
                    Obx(() => Text.rich(
                          TextSpan(
                              text:
                                  "Question ${_questionController.questionnumber.value}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(color: kSecondaryColor),
                              children: [
                                TextSpan(
                                    text:
                                        "/${_questionController.questions.length}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(color: kSecondaryColor))
                              ]),
                        )),
                    const Divider(thickness: 1.5),
                    const SizedBox(height: kDefaultPadding),
                  ],
                ),
              ),
              Expanded(
                  child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _questionController.pageController,
                      itemCount: _questionController.questions.length,
                      onPageChanged: _questionController.updateQuesNum,
                      itemBuilder: ((context, index) => QuestionCard(
                            question: _questionController.questions[index],
                          ))))
            ],
          ),
        ),
      ],
    );
  }
}
