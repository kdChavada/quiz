import 'package:flutter/material.dart';
import 'package:quiz/Database/geology/geology_quiz_db.dart';
import 'package:quiz/Model/geology_question_model.dart';

class GeologyBloc {
  Future<GeologyQuestionModel> getGeologyQuestion(BuildContext mContext) async {
    return GeologyQuestionModel.fromJson(geologyQuiz);
  }
}
