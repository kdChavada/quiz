import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/Bloc/quiz_question_bloc.dart';
import 'package:quiz/Model/chemistry_question_model.dart';
import 'package:quiz/UI/chemistry/chemistry_quiz.dart';

class ChemistryQuizLevel extends StatefulWidget {
  const ChemistryQuizLevel({Key? key}) : super(key: key);

  @override
  State<ChemistryQuizLevel> createState() => _ChemistryQuizLevelState();
}

class _ChemistryQuizLevelState extends State<ChemistryQuizLevel> {

  QuestionBloc questionBloc = QuestionBloc();

  QuestionModel questionModel = QuestionModel();

  void getData() async {
    questionModel = await questionBloc.getQuestion(context);
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
          "Chemistry Quiz Level",
            style: GoogleFonts.breeSerif(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)
        ),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: List.generate(
          questionModel.chemistryQuestion!.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LevelQuiz(level: '$index'),
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
                  "${questionModel.chemistryQuestion![index].levelId}",
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
