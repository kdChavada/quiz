import 'package:flutter/material.dart';
import 'package:quiz/Database/general/general_quiz_db.dart';
import 'package:quiz/Model/general_question_model.dart';

class  GeneralBloc{

  Future<GeneralQuestionModel> getGeneralQuestion(BuildContext mContext) async {
    return GeneralQuestionModel.fromJson(generalQuiz);
  }

}