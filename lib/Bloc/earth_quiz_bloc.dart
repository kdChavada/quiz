import 'package:flutter/material.dart';
import 'package:quiz/Database/earth/earth_question_db.dart';
import 'package:quiz/Model/earth_question_model.dart';

class  EarthQuizBloc{


  Future<EarthQuestionModel> getEarthQuiz(BuildContext mContext) async {
    return EarthQuestionModel.fromJson(earthQuestion);
  }

}