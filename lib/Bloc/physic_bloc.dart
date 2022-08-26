import 'package:flutter/cupertino.dart';

import '../Database/physic_quiz/physic_quiz_01.dart';
import '../Model/physics_question_model.dart';

class  PhysicBloc{
  Future<PhysicsQuestionModel> getPhysicsQuestion(BuildContext  mContext) async {
    return  PhysicsQuestionModel.fromJson(physicQuiz01);

  }

}