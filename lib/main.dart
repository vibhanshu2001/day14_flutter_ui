import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.pink[200],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final p = TextEditingController();
  final r = TextEditingController();
  final t = TextEditingController();
  @override
  void setState(fn) {
    super.setState(fn);
    Parser pa = Parser();
    Expression exp = pa.parse('p*r*t/100');
  }

  @override
  void dispose() {
    p.dispose();
    r.dispose();
    t.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interest Calculator"),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 30, bottom: 20),
                      child: Image(
                        image: AssetImage('assets/images/header.jpg'),
                      ),
                    ),
                    TextFormField(
                      controller: p,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Principal",
                          hintText: "Enter principal value",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: r,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Rate",
                          hintText: "Enter rate in percentage",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: t,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Time",
                          hintText: "Enter time in years",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          onPressed: (){
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  // Retrieve the text the that user has entered by using the
                                  // TextEditingController.
                                  content: Text(
                                    'Simple Interest is 200',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.pink
                                    ),
                                  ),
                                );
                              },
                            );

                          },
                          child: Text("Calculate"),
                        ),
                        SizedBox(width: 50,),
                        RaisedButton(
                          onPressed: (){},
                          child: Text("Reset"),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
