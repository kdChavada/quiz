import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/Bloc/general_bloc.dart';
import 'package:quiz/Model/general_question_model.dart';
import 'package:quiz/UI/general/general_level_quiz.dart';

class GeneralQuizLevel extends StatefulWidget {
  const GeneralQuizLevel({Key? key}) : super(key: key);

  @override
  State<GeneralQuizLevel> createState() => _GeneralQuizLevelState();
}

class _GeneralQuizLevelState extends State<GeneralQuizLevel> {
  GeneralBloc generalBloc = GeneralBloc();

  GeneralQuestionModel generalQuestionModel = GeneralQuestionModel();

  void getData() async {
    generalQuestionModel = await generalBloc.getGeneralQuestion(context);
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
            "General Quiz Level",
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
          generalQuestionModel.generalQuizQuestion!.length,
              (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GeneralQuizScreen(
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
                  "${generalQuestionModel.generalQuizQuestion![index].levelId}",
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
