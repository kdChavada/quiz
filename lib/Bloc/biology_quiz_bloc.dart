import 'package:flutter/material.dart';
import 'package:quiz/Model/biology_question_model.dart';

import '../Database/biology_quiz/biology_quiz.dart';

class BiologyBloc {
  Future<BiologyQuestionModel> getBiologyQuestion(BuildContext mContext) async {
    return BiologyQuestionModel.fromJson(BiologyQuiz);
  }
}
