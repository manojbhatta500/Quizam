import 'package:flutter/material.dart';
import 'package:quizum/brains/quizlogic.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> scorekeeper = [];

  Quizlogic manager = Quizlogic();

  int rightAnswer = 0;
  int wronganswer = 0;

  void checkanswer(bool current_answer) {
    bool real_answer = manager.getanswer();
    if (current_answer == real_answer) {
      print('answer is right');
      setState(() {
        rightAnswer++;
        scorekeeper.add(Icon(
          Icons.check,
          size: 30,
          color: Colors.green,
        ));
        manager.update_answer();
      });
    } else {
      print('answer is wrong');
      setState(() {
        wronganswer++;
        scorekeeper.add(Icon(
          Icons.close,
          size: 30,
          color: Colors.red,
        ));

        manager.update_answer();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          scorekeeper.clear();
                          manager.reset();

                          manager.answersheet.shuffle();
                          rightAnswer = 0;
                          wronganswer = 0;
                        });
                      },
                      icon: Icon(
                        Icons.refresh,
                        size: 60,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    manager.getquestion(),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 70,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white10,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          checkanswer(true);
                        },
                        child: Text(
                          'True',
                          style: TextStyle(fontSize: 30),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 70,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white10,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          checkanswer(false);
                        },
                        child: Text(
                          'False',
                          style: TextStyle(fontSize: 30),
                        )),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: scorekeeper,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Right answer : $rightAnswer',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Wrong answer : $wronganswer',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
