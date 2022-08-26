import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quiz/Model/day_quiz_model.dart';
import 'package:quiz/UI/Geology/geology_level.dart';
import 'package:quiz/UI/Technology/technology_quiz_level.dart';
import 'package:quiz/UI/biology/biology_level.dart';
import 'package:quiz/UI/chemistry/chemistry_quiz.dart';
import 'package:quiz/UI/chemistry/chemistry_quiz_level.dart';
import 'package:quiz/UI/earth/earth_quiz_leval.dart';
import 'package:quiz/UI/general/general_quiz_level.dart';
import 'package:quiz/UI/physics/physics_quiz_level.dart';
import '../Bloc/day_quiz_bloc.dart';

class DayWiseQuizMenu extends StatefulWidget {
  const DayWiseQuizMenu({Key? key}) : super(key: key);

  @override
  State<DayWiseQuizMenu> createState() => _DayWiseQuizMenuState();
}

class _DayWiseQuizMenuState extends State<DayWiseQuizMenu> {
  DayQuizModel dayQuizModel = DayQuizModel();

  DayQuizBloc dayQuizBloc = DayQuizBloc();

  void getData() async {
    dayQuizModel = await dayQuizBloc.getDayQuiz(context);

    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          "DAY QUIZ MENU",
          style: GoogleFonts.breeSerif(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: dayQuizModel.quizData!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showCupertinoModalBottomSheet(
                      enableDrag: false,
                      topRadius: const Radius.circular(30),
                      context: context,
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          backgroundColor: Colors.red,
                          centerTitle: true,
                          title: Text(
                            "DAY ${dayQuizModel.quizData![index].day}",
                            style: GoogleFonts.breeSerif(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        body: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: dayQuizModel
                                      .quizData![index].questions!.length,
                                  itemBuilder: (context, j) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (dayQuizModel.quizData![index]
                                                    .questions![j].file ==
                                                "chemistry" ||
                                            dayQuizModel.quizData![index]
                                                    .questions![j].file ==
                                                "applied_chemistry") {
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ChemistryQuizLevel(),
                                            ),
                                          );
                                        } else if (dayQuizModel.quizData![index]
                                                    .questions![j].file ==
                                                "applied_physics" ||
                                            dayQuizModel.quizData![index]
                                                    .questions![j].file ==
                                                "physics") {
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const PhysicsQuizLevel(),
                                            ),
                                          );
                                        } else if (dayQuizModel.quizData![index]
                                                .questions![j].file ==
                                            "biology") {
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const BiologyQuizLevel(),
                                            ),
                                          );
                                        } else if (dayQuizModel.quizData![index]
                                                .questions![j].file ==
                                            "geology") {
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const GeologyLevelScreen(),
                                            ),
                                          );
                                        } else if (dayQuizModel.quizData![index]
                                                .questions![j].file ==
                                            "technology") {
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const TechnologyQuizLevel(),
                                            ),
                                          );
                                        } else if (dayQuizModel.quizData![index]
                                                .questions![j].file ==
                                            "earth") {
                                          Navigator.pop(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const EarthQuizLevelScreen()));
                                        } else if (dayQuizModel.quizData![index]
                                                .questions![j].file ==
                                            "general") {
                                          Navigator.pop(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const GeneralQuizLevel()));
                                        }

                                        print(
                                            "${dayQuizModel.quizData![index].questions![j].file}");
                                      },
                                      child: Container(
                                        height: h * 0.15,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/button1.png'),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "${dayQuizModel.quizData![index].questions![j].file}",
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: h * 0.15,
                    width: w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/button2.png'),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "DAY ${dayQuizModel.quizData![index].day}",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
