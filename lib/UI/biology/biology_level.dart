import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/Bloc/biology_quiz_bloc.dart';
import 'package:quiz/Model/biology_question_model.dart';
import 'package:quiz/UI/biology/biology_quiz.dart';



class BiologyQuizLevel extends StatefulWidget {
  const BiologyQuizLevel({Key? key}) : super(key: key);

  @override
  State<BiologyQuizLevel> createState() => _BiologyQuizLevelState();
}

class _BiologyQuizLevelState extends State<BiologyQuizLevel> {



  BiologyBloc  biologyBloc  =  BiologyBloc();

  BiologyQuestionModel  biologyQuestionModel  = BiologyQuestionModel();


  void getData() async {
    biologyQuestionModel = await biologyBloc.getBiologyQuestion(context);
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
          "Biology Quiz Level",
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

            biologyQuestionModel.biologyQuizData!.length,
              (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BiologyQuizScreen(level: '$index'),
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
                  "${biologyQuestionModel.biologyQuizData![index].levelId}",
                  style: GoogleFonts.rubikWetPaint(
                      fontSize: 35,
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
