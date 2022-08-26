import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/UI/defination/defination_view_01.dart';
import 'package:quiz/UI/defination/defination_view_02.dart';

import 'defination_view_03.dart';

class DefinitionScreen extends StatefulWidget {
  const DefinitionScreen({Key? key}) : super(key: key);

  @override
  State<DefinitionScreen> createState() => _DefinitionScreenState();
}

class _DefinitionScreenState extends State<DefinitionScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          "Definition",
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
                      builder: (context) =>
                          DefinitionViewScreen(title: 'Definition Word 01')));
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
                  "Definition Word 01",
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
                      builder: (context) =>
                          DefinitionViewScreen02(title: 'Definition Word 02')));
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
                  "Definition Word 02",
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
                      builder: (context) =>
                          DefinitionViewScreen03(title: 'Definition Word 03')));
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
                  "Definition Word 03",
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
