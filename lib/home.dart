import 'package:calculator/components/my_btn.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        userInput.toString(),
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        answer.toString(),
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      CalulatorBtn(
                        title: 'AC',
                        onPressed: (() {
                          userInput = '';
                          answer = '';
                          setState(() {});
                        }),
                      ),
                      CalulatorBtn(
                        title: '+/-',
                        onPressed: (() {
                          userInput += '+/-';
                          setState(() {});
                        }),
                      ),
                      CalulatorBtn(
                        title: '%',
                        onPressed: (() {
                          userInput += '%';
                          setState(() {});
                        }),
                      ),
                      CalulatorBtn(
                        title: '/',
                        onPressed: (() {
                          userInput += '/';
                          setState(() {});
                        }),
                        color: Color(0xffffa00a),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalulatorBtn(
                        title: '7',
                        onPressed: () {
                          userInput += '7';
                          setState(() {});
                        },
                      ),
                      CalulatorBtn(
                        title: '8',
                        onPressed: () {
                          userInput += '8';
                          setState(() {});
                        },
                      ),
                      CalulatorBtn(
                        title: '0',
                        onPressed: (() {
                          userInput += '0';
                          setState(() {});
                        }),
                      ),
                      CalulatorBtn(
                        title: 'x',
                        onPressed: (() {
                          userInput += 'x';
                          setState(() {});
                        }),
                        color: Color(0xffffa00a),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalulatorBtn(
                        title: '4',
                        onPressed: (() {
                          userInput += '4';
                          setState(() {});
                        }),
                      ),
                      CalulatorBtn(
                        title: '5',
                        onPressed: (() {
                          userInput += '5';
                          setState(() {});
                        }),
                      ),
                      CalulatorBtn(
                        title: '6',
                        onPressed: (() {
                          userInput += '6';
                          setState(() {});
                        }),
                      ),
                      CalulatorBtn(
                        title: '-',
                        onPressed: (() {
                          userInput += '-';
                          setState(() {});
                        }),
                        color: Color(0xffffa00a),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalulatorBtn(
                        title: '1',
                        onPressed: (() {
                          userInput += '1';
                          setState(() {});
                        }),
                      ),
                      CalulatorBtn(
                        title: '2',
                        onPressed: (() {
                          userInput += '2';
                          setState(() {});
                        }),
                      ),
                      CalulatorBtn(
                        title: '3',
                        onPressed: (() {
                          userInput += '3';
                          setState(() {});
                        }),
                      ),
                      CalulatorBtn(
                        title: '+',
                        onPressed: (() {
                          userInput += '+';
                          setState(() {});
                        }),
                        color: Color(0xffffa00a),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CalulatorBtn(
                        title: '0',
                        onPressed: (() {
                          userInput += '0';
                          setState(() {});
                        }),
                      ),
                      CalulatorBtn(
                        title: '.',
                        onPressed: (() {
                          userInput += '.';
                          setState(() {});
                        }),
                      ),
                      CalulatorBtn(
                        title: 'DEL',
                        onPressed: (() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                          setState(() {});
                        }),
                      ),
                      CalulatorBtn(
                        title: '=',
                        onPressed: (() {
                          equalPress();
                          setState(() {});
                        }),
                        color: const Color(0xffffa00a),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  void equalPress() {
    String FinalUserInput = userInput;
    FinalUserInput = userInput.replaceAll('x', '*');
    Parser parser = Parser();
    Expression expression = parser.parse(FinalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
