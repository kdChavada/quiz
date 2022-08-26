import 'package:flutter/material.dart';
import 'package:quiz/Database/daily_fact/daily_fact_01.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("WelCome"),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: dailyFact01.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(),
              margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
              width: w,
              child: Text("${dailyFact01[index]['fact']}"),
            );
          }),
    );
  }
}
