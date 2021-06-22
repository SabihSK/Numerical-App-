import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
// import 'dart:io';
import 'dart:math';
// import 'package:fl_chart/fl_chart.dart';

class Bisection extends StatefulWidget {
  const Bisection({Key? key}) : super(key: key);

  @override
  _BisectionState createState() => _BisectionState();
}

class _BisectionState extends State<Bisection> {
  String? s1;
  String? s2;
  void mainfunc(String? s1, String? s2) {
    double a = 0;
    double b = 0;

    print("we have an equation x^2 + x + 2");

    // String? s1 = stdin.readLineSync();
    if (s1 != null) {
      if (double.tryParse(s1) != null) {
        a = double.parse(s1);
        print('double $a'); // Or do whatever you want with your double value
      }
    }

    // String? s2 = stdin.readLineSync();
    if (s2 != null) {
      if (double.tryParse(s2) != null) {
        b = double.parse(s2);
        print('double $b'); // Or do whatever you want with your double value
      }
    }
    // bisection(a, b);
    bisection(a, b);
  }

  double epsilon = 0.01;
  List<double> iter = [];
  double cval = 0.0;
  String cvaltext = "";

// An example function whose solution is determined using
// Bisection Method. The function is x^3 - x^2 - 4
  double func(double x) {
    return (pow(x, 3)) - (pow(x, 2)) - 4;
  }

// Prints root of func(x) with error of EPSILON
  void bisection(double a, double b) {
    if (func(a) * func(b) >= 0) {
      print("You have not assumed right a and b\n");
      stringset();
      return;
    }

    double c = a;
    while ((b - a) >= epsilon) {
      // Find middle point
      c = (a + b) / 2;

      // Check if middle point is root
      if (func(c) == 0.0) {
        c = double.parse((c).toStringAsFixed(4));
        iter.add(c);
        break;
      }

      // Decide the side to repeat the steps
      else if (func(c) * func(a) < 0) {
        b = c;
      } else {
        a = c;
      }
      c = double.parse((c).toStringAsFixed(4));
      print(c);
      iter.add(c);
      // print(c);
    }
    cval = c;
    print("The value of root is : $c");
    // print(iter);
  }

  String title1 = "";
  String title2 = "";
  bool calbtn = true;

  void setText() {
    setState(() {
      calbtn = false;
      s1 = title1;
      s2 = title2;
      mainfunc(s1, s2);
    });
  }

  void kuchbi() {
    Feature feature = new Feature(
      title: "Drink Water",
      color: Colors.blue,
      data: iter,
    );

    features.add(feature);
    setState(() {
      cvaltext = "The value of root is : " + cval.toString() + "\n\nGo Back";
    });
  }

  List<Feature> features = [];

  String valass = "";
  void stringset() {
    setState(() {
      valass =
          "You have not assumed right a and b\nGo back and select the correct option";
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "x^3 - x^2 - 4",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: width * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    child: calbtn
                        ? TextField(
                            decoration: InputDecoration(
                              labelText: 'a',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) => title1 = value,
                          )
                        : null,
                  ),
                  SizedBox(
                    width: 100,
                    child: calbtn
                        ? TextField(
                            decoration: InputDecoration(
                              labelText: 'b',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) => title2 = value,
                          )
                        : null,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: calbtn
                    ? () {
                        setText();
                        kuchbi();
                      }
                    : null,
                child: Text("Calculation"),
              ),
              Text(valass),
              SizedBox(
                height: 50,
              ),
              LineGraph(
                features: features,
                size: Size(width * 0.5, width * 0.5),
                labelX: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'],
                labelY: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'],
                showDescription: false,
                graphColor: Colors.black,
                graphOpacity: 0.2,
                verticalFeatureDirection: false,
                descriptionHeight: 130,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                cvaltext,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
