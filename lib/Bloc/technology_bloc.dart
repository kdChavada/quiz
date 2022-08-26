import 'package:flutter/material.dart';
import 'package:quiz/Database/technology/technology_quiz_db.dart';
import 'package:quiz/Model/technology_question_model.dart';

class  TechnologyBloc{

  Future<TechnologyQuestionModel> getQuestion(BuildContext mContext) async {
    return TechnologyQuestionModel.fromJson(technologyQuiz);
  }

}