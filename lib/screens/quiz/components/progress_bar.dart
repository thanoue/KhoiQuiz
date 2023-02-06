import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF3F4768), width: 3),
          borderRadius: BorderRadius.circular(50)),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                    builder: ((context, constraints) => Container(
                          width:
                              constraints.maxWidth * controller.anmation.value,
                          decoration: BoxDecoration(
                              gradient: kPrimaryGradient,
                              borderRadius: BorderRadius.circular(50)),
                        ))),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "${(controller.anmation.value * controller.animController.duration?.inSeconds).round()} sec"),
                        //WebsafeSvg.asset('assets/icons/clock.svg')
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
