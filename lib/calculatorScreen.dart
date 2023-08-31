import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class calculatorScreen extends StatefulWidget {
  const calculatorScreen({super.key});

  @override
  State<calculatorScreen> createState() => _calculatorScreenState();
}

class _calculatorScreenState extends State<calculatorScreen> {

  String userInput = "";
  String result = "0";
  Parser parser = Parser();
  ContextModel contextModel = ContextModel();

  static const Color appBackgroundColor = Color(0xff0E2433);
  static const Color buttonBackgroundColor = Color(0xff0B344F);
  static const Color equalButtonColor = Color(0xff296D98);


  void calculate() {
    try {
      Expression expression = parser.parse(userInput);
      double evalResult = expression.evaluate(EvaluationType.REAL, contextModel);

      if(evalResult == evalResult.toInt()){
        result = evalResult.toInt().toString();
      }
      else{
        result = evalResult.toStringAsFixed(2);
      }
    }
    catch (e) {
      result = 'Error';
    }
  }

  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        calculate();
      }
      else if (buttonText == 'C') {
        userInput = '';
        result = '0';
      }
      else if (buttonText == 'X') {
        if (userInput.isNotEmpty) {
          userInput = userInput.substring(0, userInput.length - 1);
        }
      }
      else if (buttonText == '%') {
        userInput = userInput.replaceAll('%', '');
        double inputNumber = double.tryParse(userInput) ?? 0;
        double resultValue = inputNumber / 100;
        userInput = resultValue.toString();
      }
      else {
        userInput += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Calculator',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: appBackgroundColor,
      ),

      body: Column(
        children: [
          Expanded(
            child:
            Container(
              color: appBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  bottom: 50,
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(userInput, style: TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(result, style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500 ,color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: buttonBackgroundColor,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: TextButton(
                              onPressed: (){},
                              child: const Text("V", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          child: TextButton(
                              onPressed: () => onButtonPressed('('),
                              child: const Text("(", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          child: TextButton(
                              onPressed: () => onButtonPressed('1'),
                              child: const Text("1", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          child: TextButton(
                              onPressed: () => onButtonPressed('4'),
                              child: const Text("4", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          child: TextButton(
                              onPressed: () => onButtonPressed('7'),
                              child: const Text("7", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          child: TextButton(
                              onPressed: () => onButtonPressed('0'),
                              child: const Text("0", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: TextButton(
                              onPressed: () => onButtonPressed('C'),
                              child: const Text("C", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          child: TextButton(
                              onPressed: ()  => onButtonPressed(')'),
                              child: const Text(")", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          child: TextButton(
                              onPressed: () => onButtonPressed('2'),
                              child: const Text("2", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          child: TextButton(
                              onPressed: () => onButtonPressed('5'),
                              child: const Text("5", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          child: TextButton(
                              onPressed: () => onButtonPressed('8'),
                              child: const Text("8", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          child: TextButton(
                              onPressed: () => onButtonPressed('00'),
                              child: const Text("00", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: TextButton(
                              onPressed: () => onButtonPressed('X'),
                              child: const Text("X", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          child: TextButton(
                              onPressed: ()  => onButtonPressed('%'),
                              child: const Text("%", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          child: TextButton(
                              onPressed: () => onButtonPressed('3'),
                              child: const Text("3", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          child: TextButton(
                              onPressed: () => onButtonPressed('6'),
                              child: const Text("6", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          child: TextButton(
                              onPressed: () => onButtonPressed('9'),
                              child: const Text("9", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          child: TextButton(
                              onPressed: () => onButtonPressed('.'),
                              child: const Text(".", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextButton(
                              onPressed: () => onButtonPressed('/'),
                              child: const Text("/", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: TextButton(
                              onPressed: () => onButtonPressed('*'),
                              child: const Text("*", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: TextButton(
                              onPressed: () => onButtonPressed('-'),
                              child: const Text("-", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: TextButton(
                              onPressed: () => onButtonPressed('+'),
                              child: const Text("+", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),

                        Expanded(
                          flex: 2,
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(equalButtonColor),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      )
                                  )
                              ),
                              onPressed: () => onButtonPressed('='),
                              child: const Text("=", style: TextStyle(fontSize: 20,color: Colors.white),)
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

