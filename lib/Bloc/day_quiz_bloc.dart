import 'package:flutter/material.dart';
import 'package:quiz/Model/day_quiz_model.dart';

import '../Database/daily_quiz/daily_quiz_db.dart';

class DayQuizBloc {
  Future<DayQuizModel> getDayQuiz(BuildContext mContext) async {
    return DayQuizModel.fromJson(dayQuiz);
  }
}
