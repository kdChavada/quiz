import 'package:flutter/cupertino.dart';

import 'package:quiz/Model/chemistry_question_model.dart';

import '../Database/chemistry_quiz/chemistry_quiz_01.dart';


class QuestionBloc {
  Future<QuestionModel> getQuestion(BuildContext mContext) async {
    return QuestionModel.fromJson(chemistryQuiz);
  }





}
