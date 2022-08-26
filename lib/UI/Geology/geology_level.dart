import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/Bloc/geology_bloc.dart';
import 'package:quiz/Model/geology_question_model.dart';
import 'package:quiz/UI/Geology/geology_quiz_screen.dart';

class GeologyLevelScreen extends StatefulWidget {
  const GeologyLevelScreen({Key? key}) : super(key: key);

  @override
  State<GeologyLevelScreen> createState() => _GeologyLevelScreenState();
}

class _GeologyLevelScreenState extends State<GeologyLevelScreen> {

  GeologyQuestionModel geologyQuestionModel = GeologyQuestionModel();


  GeologyBloc geologyBloc = GeologyBloc();


  void getData() async {
    geologyQuestionModel = await geologyBloc.getGeologyQuestion(context);
    setState(() {

    });
  }


  @override
  void initState() {
    getData();
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title:   Text(
            "Geology Quiz Level",
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

          geologyQuestionModel.geologyQuiz!.length,
              (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GeologyQuizScreen(level: '$index'),
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
                  "${geologyQuestionModel.geologyQuiz![index].levelId}",
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
