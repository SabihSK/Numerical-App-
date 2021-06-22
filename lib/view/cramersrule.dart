import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CramerRule extends StatefulWidget {
  const CramerRule({Key? key}) : super(key: key);

  @override
  _CramerRuleState createState() => _CramerRuleState();
}

class _CramerRuleState extends State<CramerRule> {
// This functions finds the determinant of Matrix
  double determinantOfMatrix(List mat) {
    double ans;
    ans = mat[0][0] * (mat[1][1] * mat[2][2] - mat[2][1] * mat[1][2]) -
        mat[0][1] * (mat[1][0] * mat[2][2] - mat[1][2] * mat[2][0]) +
        mat[0][2] * (mat[1][0] * mat[2][1] - mat[1][1] * mat[2][0]);
    return ans;
  }

// This function finds the solution of system of
// linear equations using cramer's rule
  double x = 0;
  double y = 0;
  double z = 0;
  void findSolution(List coeff) {
    // Matrix d using coeff as given in cramer's rule
    List d = [
      [coeff[0][0], coeff[0][1], coeff[0][2]],
      [coeff[1][0], coeff[1][1], coeff[1][2]],
      [coeff[2][0], coeff[2][1], coeff[2][2]],
    ];
    // Matrix d1 using coeff as given in cramer's rule
    List d1 = [
      [coeff[0][3], coeff[0][1], coeff[0][2]],
      [coeff[1][3], coeff[1][1], coeff[1][2]],
      [coeff[2][3], coeff[2][1], coeff[2][2]],
    ];
    // Matrix d2 using coeff as given in cramer's rule
    List d2 = [
      [coeff[0][0], coeff[0][3], coeff[0][2]],
      [coeff[1][0], coeff[1][3], coeff[1][2]],
      [coeff[2][0], coeff[2][3], coeff[2][2]],
    ];
    // Matrix d3 using coeff as given in cramer's rule
    List d3 = [
      [coeff[0][0], coeff[0][1], coeff[0][3]],
      [coeff[1][0], coeff[1][1], coeff[1][3]],
      [coeff[2][0], coeff[2][1], coeff[2][3]],
    ];

    // Calculating Determinant of Matrices d, d1, d2, d3
    double D = determinantOfMatrix(d);
    double D1 = determinantOfMatrix(d1);
    double D2 = determinantOfMatrix(d2);
    double D3 = determinantOfMatrix(d3);
    print("D is : $D");
    print("D1 is : $D1");
    print("D2 is : $D2");
    print("D3 is : $D3");

    // Case 1
    if (D != 0) {
      // Coeff have a unique solution. Apply Cramer's Rule
      x = D1 / D;
      y = D2 / D;
      z = D3 / D; // calculating z using cramer's rule
      print("Value of x is : $x");
      print("Value of y is : $y");
      print("Value of z is : $z");
      result();
    }
    // Case 2
    else {
      if (D1 == 0 && D2 == 0 && D3 == 0) {
        print("Infinite solutions\n");
        infi();
      } else if (D1 != 0 || D2 != 0 || D3 != 0) {
        print("No solutions\n");
      }
    }
  }

  void infi() {
    setState(() {
      resultText = "Infinite solutions";
    });
  }

  String resultText = "";
  void result() {
    setState(() {
      resultText = "Value of x is : $x\nValue of y is : $y\nValue of z is : $z";
    });
  }

// Driver Code
  // int mainfunc() {
  //   // storing coefficients of linear equations in coeff matrix
  //   List coeff = [
  //     [1, 1, -1, -2],
  //     [2, -1, 1, 0],
  //     [1, -2, 3, 1],
  //   ];

  //   findSolution(coeff);
  //   return 0;
  // }

  bool calbtn = true;
  String title1 = "";
  String title2 = "";
  String title3 = "";
  String title4 = "";
  String title5 = "";
  String title6 = "";
  String title7 = "";
  String title8 = "";
  String title9 = "";
  String title10 = "";
  String title11 = "";
  String title12 = "";

  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  String? s6;
  String? s7;
  String? s8;
  String? s9;
  String? s10;
  String? s11;
  String? s12;

  void setText() {
    setState(() {
      calbtn = false;
      s1 = title1;
      s2 = title2;
      s3 = title3;
      s4 = title4;
      s5 = title5;
      s6 = title6;
      s7 = title7;
      s8 = title8;
      s9 = title9;
      s10 = title10;
      s11 = title11;
      s12 = title12;
      mainfunc(s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12);
    });
  }

  void mainfunc(
      String? s1,
      String? s2,
      String? s3,
      String? s4,
      String? s5,
      String? s6,
      String? s7,
      String? s8,
      String? s9,
      String? s10,
      String? s11,
      String? s12) {
    double a = 0;
    double b = 0;
    double c = 0;
    double d = 0;
    double e = 0;
    double f = 0;
    double g = 0;
    double h = 0;
    double i = 0;
    double j = 0;
    double k = 0;
    double l = 0;

    a = chekc(s1);
    b = chekc(s2);
    c = chekc(s3);
    d = chekc(s4);
    e = chekc(s5);
    f = chekc(s6);
    g = chekc(s7);
    h = chekc(s8);
    i = chekc(s9);
    j = chekc(s10);
    k = chekc(s11);
    l = chekc(s12);

    List coeff = [
      [a, b, c, d],
      [e, f, g, h],
      [i, j, k, l]
    ];
    findSolution(coeff);

    // regulaFalsi(a, b);
  }

  double chekc(String? a) {
    double b = 0;
    if (a != null) {
      if (double.tryParse(a) != null) {
        b = double.parse(a);
        print('double $b');
      }
    }
    return b;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Cramer's Rule\n\nEnter the coefficients with there sign",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'x1',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => title1 = value,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'x2',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => title2 = value,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'x3',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => title3 = value,
                      ),
                    ),
                  ),
                  Text("="),
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'b',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => title4 = value,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'x1',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => title5 = value,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'x2',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => title6 = value,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'x3',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => title7 = value,
                      ),
                    ),
                  ),
                  Text("="),
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'b',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => title8 = value,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'x1',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => title9 = value,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'x2',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => title10 = value,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'x3',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => title11 = value,
                      ),
                    ),
                  ),
                  Text("="),
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'b',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) => title12 = value,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: calbtn
                    ? () {
                        setText();
                      }
                    : null,
                child: Text("Calculation"),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                resultText,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
