import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double firstNumber = 0;
   double secondNumber = 0;
   String textToDisplay = "";
   String result = "";
  String operatorToPerform = "";
  buttonClick(String buttonValue) {
    if (buttonValue == "AC") {
      firstNumber = 0;
      secondNumber = 0;
      textToDisplay = "";
      result = "";
      operatorToPerform = "";
    }
    else if (buttonValue == ".")
    {
      if(result.contains("."))
      {
        // print("Already have a decimal");
        return;
      }
      else
      {
        result=(result+buttonValue);
      }
    }
    else if(buttonValue=="◀")
    {
      if(textToDisplay.isNotEmpty)
      {
        result=textToDisplay.substring(0,result.length-1);
      }
      else
      {
        return;
      }
    }
    else if (buttonValue == "+" ||
        buttonValue == "-" ||
        buttonValue == "x" ||
        buttonValue == "/" ||
        buttonValue == "%" ) {
      try {
        firstNumber = double.parse(textToDisplay);
        result = "";
        operatorToPerform = buttonValue;
      } catch (e) {
        // print(e);
      }
    } else if (buttonValue == "=")
    {
      try {
        secondNumber = double.parse(textToDisplay);

      } catch (e) {
        // print(e);
      }

      if (operatorToPerform == "+")
      {
        result = (firstNumber+ secondNumber).toString();
      }
      else if (operatorToPerform == "-")
      {
        result = (firstNumber- secondNumber).toString();
      }
      else if (operatorToPerform == "x")
      {
        result = (firstNumber* secondNumber).toString();
      }
      else if (operatorToPerform == "/")
      {
        result = ((firstNumber/ secondNumber).toStringAsFixed(2)).toString();
      }
      else if (operatorToPerform == "%")
      {
        result = ((firstNumber% secondNumber).toStringAsFixed(2)).toString();
      }
    }
    else //if user press any number value
        {
      result = int.parse(textToDisplay+ buttonValue).toString();
    }

    setState(()
    {
      textToDisplay = result;
    }
    );
  }

  Widget customButton(String buttonValue,textColor) {
    return Expanded(
      child: MaterialButton(
        padding: const EdgeInsets.all(20),
        onPressed: () => buttonClick(buttonValue),
        textColor:textColor,
        child: Text(
          buttonValue,
          style: const TextStyle(
            fontSize:30,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Calculator",
        home: Scaffold(
        backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text("Calculator",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
          ),
          body: Column(
            //  mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.grey,
                  padding: const EdgeInsets.all(20.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "$firstNumber $operatorToPerform $secondNumber\n= $textToDisplay",
                    style: const TextStyle(
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  customButton("AC",Colors.deepOrangeAccent),
                  customButton("◀",Colors.deepOrangeAccent),
                  customButton("%",Colors.deepOrangeAccent),
                  customButton("/",Colors.deepOrangeAccent),
                ],
              ),
              Row(
                children: <Widget>[
                  customButton("7",Colors.white),
                  customButton("8",Colors.white),
                  customButton("9",Colors.white),
                  customButton("x",Colors.deepOrangeAccent),
                ],
              ),
              Row(
                children: <Widget>[
                  customButton("4",Colors.white),
                  customButton("5",Colors.white),
                  customButton("6",Colors.white),
                  customButton("-",Colors.deepOrangeAccent),
                ],
              ),
              Row(
                children: <Widget>[
                  customButton("1",Colors.white),
                  customButton("2",Colors.white),
                  customButton("3",Colors.white),
                  customButton("+",Colors.deepOrangeAccent),
                ],
              ),
              Row(
                children: <Widget>[

                  const SizedBox(width: 90),
                  customButton("0",Colors.white),
                  const SizedBox(width: 90),
                  customButton("=",Colors.deepOrangeAccent),

                ],
              ),
            ],
          ),
        )
    );
  }
}
