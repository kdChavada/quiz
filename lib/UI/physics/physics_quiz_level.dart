import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/Bloc/physic_bloc.dart';
import 'package:quiz/UI/physics/physics_level_quiz.dart';

import '../../Model/physics_question_model.dart';

class PhysicsQuizLevel extends StatefulWidget {
  const PhysicsQuizLevel({Key? key}) : super(key: key);

  @override
  State<PhysicsQuizLevel> createState() => _PhysicsQuizLevelState();
}

class _PhysicsQuizLevelState extends State<PhysicsQuizLevel> {
  PhysicBloc questionBloc = PhysicBloc();

  PhysicsQuestionModel phyQuestionModel = PhysicsQuestionModel();

  void getData() async {
    phyQuestionModel = await questionBloc.getPhysicsQuestion(context);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title:   Text(
          "Physics Quiz Level",
            style: GoogleFonts.breeSerif(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)
        ),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: List.generate(
          phyQuestionModel.physicQuiz!.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhysicsLevelQuiz(
                    level: '$index',
                  ),
                ),
              );
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/button2.png',
                      ),
                      fit: BoxFit.fill)
                  // color: Colors.green,
                  // borderRadius: BorderRadius.circular(15)
                  ),
              child: Center(
                child: Text(
                  "${phyQuestionModel.physicQuiz![index].levelId}",
                  style: GoogleFonts.rubikWetPaint(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
