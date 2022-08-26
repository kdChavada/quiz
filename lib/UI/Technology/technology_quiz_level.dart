import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/Bloc/technology_bloc.dart';
import 'package:quiz/Model/technology_question_model.dart';
import 'package:quiz/UI/Technology/technology_level_quiz.dart';

class TechnologyQuizLevel extends StatefulWidget {
  const TechnologyQuizLevel({Key? key}) : super(key: key);

  @override
  State<TechnologyQuizLevel> createState() => _TechnologyQuizLevelState();
}

class _TechnologyQuizLevelState extends State<TechnologyQuizLevel> {
  TechnologyBloc technologyBloc = TechnologyBloc();

  TechnologyQuestionModel technologyQuestionModel = TechnologyQuestionModel();

  void getData() async {
    technologyQuestionModel = await technologyBloc.getQuestion(context);

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
            "Technology Quiz Level",
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
          technologyQuestionModel.technologyQuiz!.length,
              (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TechnologyQuizScreen(
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
                  "${technologyQuestionModel.technologyQuiz![index].levelId}",
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
