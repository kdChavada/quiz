import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Bloc/quiz_question_bloc.dart';
import '../../Model/chemistry_question_model.dart';

class LevelQuiz extends StatefulWidget {
  String level;

  LevelQuiz({Key? key, required this.level}) : super(key: key);

  @override
  State<LevelQuiz> createState() => _LevelQuizState();
}

class _LevelQuizState extends State<LevelQuiz> {


  PageController  pageController =  PageController(initialPage: 0);
  QuestionBloc questionBloc = QuestionBloc();

  QuestionModel questionModel = QuestionModel();

  void getData() async {
    questionModel = await questionBloc.getQuestion(context);
    setState(() {});
  }

  bool selectOption = false;

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
        controller: pageController,
          // shrinkWrap: true,
          reverse: false,
            physics: const NeverScrollableScrollPhysics(),
          itemCount: questionModel
              .chemistryQuestion![int.parse(widget.level)].questions!.length,
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
                        "${j + 1} ${questionModel.chemistryQuestion![int.parse(widget.level)].questions![j].question}",
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
                    itemCount: questionModel
                        .chemistryQuestion![int.parse(widget.level)]
                        .questions![j]
                        .options!
                        .length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      print(questionModel
                          .chemistryQuestion![int.parse(widget.level)]
                          .questions![j]
                          .options!
                          .length);
                      return GestureDetector(
                        onTap: () {
                          //   selectOption  = true;
                          // }else{
                          //   selectOption  = false;
                          // }





                          selectOption =  true;


                          pageController.jumpToPage(i+1);


                          print(questionModel
                              .chemistryQuestion![int.parse(widget.level)]
                              .questions![j]
                              .options!
                              .length,);



                          print(questionModel.chemistryQuestion![int.parse(widget.level)].questions![j].options![i].isAnswer);

                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 20),
                          height: 50,
                          width: w,
                          decoration: BoxDecoration(
                              image:   DecorationImage(
                                  image:
                                  selectOption ==  true && (questionModel.chemistryQuestion![int.parse(widget.level)].questions![j].options![i].isAnswer)! ? const AssetImage('assets/images/button 4.png') :  const AssetImage('assets/images/button 3.png'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              "${questionModel.chemistryQuestion![int.parse(widget.level)].questions![j].options![i].option}",
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
