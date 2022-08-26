import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/Bloc/earth_quiz_bloc.dart';
import 'package:quiz/Model/earth_question_model.dart';

import 'earth_leval_quiz.dart';

class EarthQuizLevelScreen extends StatefulWidget {
  const EarthQuizLevelScreen({Key? key}) : super(key: key);

  @override
  State<EarthQuizLevelScreen> createState() => _EarthQuizLevelScreenState();
}

class _EarthQuizLevelScreenState extends State<EarthQuizLevelScreen> {
  EarthQuizBloc earthQuizBloc = EarthQuizBloc();

  EarthQuestionModel earthQuestionModel = EarthQuestionModel();

  void getData() async {
    earthQuestionModel = await earthQuizBloc.getEarthQuiz(context);
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
            "Earth Quiz Level",
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
          earthQuestionModel.earthQuestion!.length,
              (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EarthQuizScreen(
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
                  "${earthQuestionModel.earthQuestion![index].levelId}",
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
