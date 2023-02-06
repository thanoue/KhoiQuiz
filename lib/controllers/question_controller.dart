import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/screens/score/score_scree.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController _animController;

  Animation _anim;

  Animation get anmation => _anim;
  AnimationController get animController => _animController;
  List<Question> get questions => _question;

  final List<Question> _question = sample_data
      .map((e) => Question(
          id: e['id'],
          question: e['question'],
          answer: e['answer_index'],
          options: e['options']))
      .toList();

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns = 0;
  int get correctAns => this._correctAns;

  int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionnumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  PageController _pageController;
  PageController get pageController => this._pageController;

  @override
  void onInit() {
    _pageController = PageController();

    _animController =
        AnimationController(vsync: this, duration: const Duration(seconds: 30));

    _anim = Tween<double>(begin: 0, end: 1).animate(_animController)
      ..addListener(() {
        update();
      });

    _animController.forward().whenComplete(() => nextQuestion());

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_selectedAns == _correctAns) {
      _numOfCorrectAns += 1;
    }

    _animController.stop();

    update();

    Future.delayed(Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value < _question.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.ease);

      _animController.reset();
      _animController.forward().whenComplete(() => nextQuestion());

      return;
    }

    Get.to(ScoreScreen());
  }

  void updateQuesNum(int index) {
    this._questionNumber.value = index + 1;
  }
}
