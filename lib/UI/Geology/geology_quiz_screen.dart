import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Bloc/geology_bloc.dart';
import '../../Model/geology_question_model.dart';

class GeologyQuizScreen extends StatefulWidget {
  String level;
   GeologyQuizScreen({Key? key,required  this.level}) : super(key: key);

  @override
  State<GeologyQuizScreen> createState() => _GeologyQuizScreenState();
}

class _GeologyQuizScreenState extends State<GeologyQuizScreen> {


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

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          "Quiz",
          style: GoogleFonts.breeSerif(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: PageView.builder(
        // shrinkWrap: true,
          reverse: false,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: geologyQuestionModel
              .geologyQuiz![int.parse(widget.level)].questions!.length,
          itemBuilder: (context, j) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: h * 0.3,
                  width: w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/button 5.png'),
                        fit: BoxFit.fill),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: w * 0.8,
                      child: Text(
                        "${j + 1} ${ geologyQuestionModel
                            .geologyQuiz![int.parse(widget.level)].questions![j].question}",
                        style: GoogleFonts.fuzzyBubbles(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount:  geologyQuestionModel
                        .geologyQuiz
                    ![int.parse(widget.level)]
                        .questions![j]
                        .options!
                        .length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 20),
                          height: 50,
                          width: w,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image:
                                  AssetImage('assets/images/button 3.png'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              "${ geologyQuestionModel
                                  .geologyQuiz![int.parse(widget.level)].questions![j].options![i].option}",
                              textScaleFactor: 0.85,
                              style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    })
              ],
            );
          }),
    );
  }
}
