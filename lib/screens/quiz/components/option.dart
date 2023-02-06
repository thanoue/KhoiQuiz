import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz/controllers/question_controller.dart';

import '../../../constants.dart';

class Option extends StatelessWidget {
  const Option({
    Key key,
    @required this.content,
    @required this.index,
    @required this.press,
  }) : super(key: key);

  final String content;
  final int index;
  final VoidCallback press;

  IconData getTheRightIcon(QuestionController quesControlerer) {
    return getTheRightColor(quesControlerer) == kGreenColor
        ? Icons.done
        : Icons.close;
  }

  Color getTheRightColor(QuestionController quesControlerer) {
    if (quesControlerer.isAnswered) {
      if (index == quesControlerer.correctAns) {
        return kGreenColor;
      } else {
        if (index == quesControlerer.selectedAns &&
            quesControlerer.correctAns != quesControlerer.selectedAns) {
          return kRedColor;
        }
      }
    }

    return kGrayColor;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (quesController) {
          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: kDefaultPadding),
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                  border: Border.all(color: getTheRightColor(quesController)),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${index + 1} ${content}",
                    style: TextStyle(
                        color: getTheRightColor(quesController), fontSize: 17),
                  ),
                  Spacer(),
                  Container(
                    height: 27,
                    width: 27,
                    child: getTheRightColor(quesController) == kGrayColor
                        ? null
                        : Icon(getTheRightIcon(quesController)),
                    decoration: BoxDecoration(
                      color: getTheRightColor(quesController) == kGrayColor
                          ? Colors.transparent
                          : getTheRightColor(quesController),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          color: getTheRightColor(quesController), width: 2),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
