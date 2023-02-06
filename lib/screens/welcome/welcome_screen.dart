import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/screens/quiz/quiz_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:quiz/screens/score/score_scree.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            'assets/icons/bg.svg',
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    "Let's Play Quiz",
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Text("Enter Your Name Below"),
                  Container(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: 'Full Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => Get.to(QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                      decoration: const BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Text(
                        "Lets Start Quiz",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
