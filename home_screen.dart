import 'package:flutter/material.dart';
import 'package:my_awesome_app/components/mybutton.dart';
import 'package:my_awesome_app/constants.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    print('rebuild');
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(alignment: Alignment.bottomRight),
                      Text(
                        userInput.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      SizedBox(height: 15),
                      Text(
                        answer.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MYBUTTON(
                            title: 'AC',
                            onpress: () {
                              userInput = '';
                              answer = '';
                              setState(() {});
                            },
                          ),
                          MYBUTTON(
                            title: '+/-',
                            onpress: () {
                              userInput += '+/-';
                              setState(() {});
                            },
                          ),
                          MYBUTTON(
                            title: '%',
                            onpress: () {
                              userInput += '%';
                              setState(() {});
                            },
                          ),
                          MYBUTTON(
                            title: '/',
                            onpress: () {
                              userInput += '/';
                              setState(() {});
                            },
                            color: Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MYBUTTON(
                            title: '7',
                            onpress: () {
                              userInput += '7';
                              setState(() {});
                            },
                          ),
                          MYBUTTON(
                            title: '8',
                            onpress: () {
                              userInput += '8';
                              setState(() {});
                            },
                          ),
                          MYBUTTON(
                            title: '0',
                            onpress: () {
                              userInput += '0';
                              setState(() {});
                            },
                          ),
                          MYBUTTON(
                            title: 'x',
                            onpress: () {
                              userInput += 'x';
                              setState(() {});
                            },
                            color: Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MYBUTTON(
                            title: '4',
                            onpress: () {
                              userInput += '4';
                              setState(() {});
                              print('tap');
                            },
                          ),
                          MYBUTTON(
                            title: '5',
                            onpress: () {
                              userInput += '5';
                              setState(() {});
                            },
                          ),
                          MYBUTTON(
                            title: '6',
                            onpress: () {
                              userInput += '6';
                              setState(() {});
                            },
                          ),
                          MYBUTTON(
                            title: '-',
                            onpress: () {
                              userInput += '-';
                              setState(() {});
                            },
                            color: Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MYBUTTON(
                            title: '1',
                            onpress: () {
                              userInput += '1';
                              setState(() {});
                              print('tap');
                            },
                          ),
                          MYBUTTON(
                            title: '2',
                            onpress: () {
                              userInput += '2';
                              setState(() {});
                            },
                          ),
                          MYBUTTON(
                            title: '3',
                            onpress: () {
                              userInput += '3';
                              setState(() {});
                            },
                          ),
                          MYBUTTON(
                            title: '+',
                            onpress: () {
                              userInput += '+';
                              setState(() {});
                            },
                            color: Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MYBUTTON(
                            title: '0',
                            onpress: () {
                              userInput += '0';
                              setState(() {});
                              print('tap');
                            },
                          ),
                          MYBUTTON(
                            title: '.',
                            onpress: () {
                              userInput += '.';
                              setState(() {});
                            },
                          ),
                          MYBUTTON(
                            title: 'DEL',
                            onpress: () {
                              userInput = userInput.substring(
                                0,
                                userInput.length - 1,
                              );
                              setState(() {});
                            },
                          ),
                          MYBUTTON(
                            title: '=',
                            onpress: () {
                              equalPres();
                              setState(() {});
                            },
                            color: Color(0xffffa00a),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void equalPres() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    finalUserInput = finalUserInput.replaceAll('÷', '/');
    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      answer = eval.toString();
    });
  }
}
