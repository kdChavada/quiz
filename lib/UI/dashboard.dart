import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/UI/day_wise_quiz.dart';
import 'package:quiz/UI/defination/defination_menu.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          "WEL-COME",
          style: GoogleFonts.breeSerif(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DayWiseQuizMenu(),
                ),
              );
            },
            child: Container(
              height: h * 0.15,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/button2.png'),
                ),
              ),
              child: const Center(
                child: Text(
                  "QUIZ",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DefinitionScreen(),
                ),
              );
            },
            child: Container(
              height: h * 0.15,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/button2.png'),
                ),
              ),
              child: const Center(
                child: Text(
                  "Definition",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
