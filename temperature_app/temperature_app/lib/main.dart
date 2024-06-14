import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TempApp(),
    );
  }
}

class TempApp extends StatefulWidget {
  @override
  TempState createState() => TempState();
}

class TempState extends State<TempApp> {
  double input = 0.0;
  double output = 0.0;
  bool fOrC = true;
  List<String> history = [];

  @override
  Widget build(BuildContext context) {
    TextField inputField = TextField(
      keyboardType: TextInputType.number,
      onChanged: (str) {
        try {
          input = double.parse(str);
        } catch (e) {
          input = 0.0;
        }
      },
      decoration: InputDecoration(
        labelText: "Input a Value in ${fOrC == false ? "Fahrenheit" : "Celsius"}",
      ),
      textAlign: TextAlign.center,
    );

    AppBar appBar = AppBar(
      title: Text("Temperature Calculator"),
    );

    Container tempSwitch = Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          Text("F"),
          Radio<bool>(
              groupValue: fOrC,
              value: false,
              onChanged: (v) {
                setState(() {
                  fOrC = v!;
                });
              }),
          Text("C"),
          Radio<bool>(
              groupValue: fOrC,
              value: true,
              onChanged: (v) {
                setState(() {
                  fOrC = v!;
                });
              }),
        ],
      ),
    );

    Container calcBtn = Container(
      child: ElevatedButton(
        child: Text("Calculate"),
        onPressed: () {
          setState(() {
            if (fOrC == false) {
              output = (input - 32) * (5 / 9);
              history.add("F to C: ${input.toStringAsFixed(1)} => ${output.toStringAsFixed(1)}");
            } else {
              output = (input * 9 / 5) + 32;
              history.add("C to F: ${input.toStringAsFixed(1)} => ${output.toStringAsFixed(1)}");
            }
          });
          AlertDialog dialog = AlertDialog(
            content: fOrC == false
                ? Text("${input.toStringAsFixed(2)} F : ${output.toStringAsFixed(2)} C")
                : Text("${input.toStringAsFixed(2)} C : ${output.toStringAsFixed(2)} F"),
          );
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return dialog;
            },
          );
        },
      ),
    );

    Container historyList = Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: history.map((entry) => Text(entry)).toList(),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            inputField,
            tempSwitch,
            calcBtn,
            historyList,
          ],
        ),
      ),
    );
  }
}
