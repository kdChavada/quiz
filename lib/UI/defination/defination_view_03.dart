import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Database/defination_db/defination_db_file_03.dart';

class DefinitionViewScreen03 extends StatefulWidget {
  String title;

  DefinitionViewScreen03({Key? key, required this.title}) : super(key: key);

  @override
  State<DefinitionViewScreen03> createState() => _DefinitionViewScreen03State();
}

class _DefinitionViewScreen03State extends State<DefinitionViewScreen03> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          widget.title,
          style: GoogleFonts.breeSerif(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: world2024.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.redAccent[50],
              shadowColor: Colors.redAccent,
              elevation: 5,
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Container(
                    height: h * 0.1,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/button2.png'),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "${world2024[index]['context']}",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    height: h * 0.1,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/button 3.png'),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "${world2024[index]['word']}",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    height: h * 0.25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/button 5.png'),
                          matchTextDirection: true),
                    ),
                    child: Center(
                      child: SizedBox(
                        width: w * 0.8,
                        child: Text(
                          "${world2024[index]['definition']}",
                          textScaleFactor: 0.85,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
