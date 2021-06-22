import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GaussEliminationMethod extends StatefulWidget {
  const GaussEliminationMethod({Key? key}) : super(key: key);

  @override
  _GaussEliminationMethodState createState() => _GaussEliminationMethodState();
}

class _GaussEliminationMethodState extends State<GaussEliminationMethod> {
  // #define N 3	 // Number of unknowns

// function to get matrix content
  void gaussianElimination(List mat) {
    /* reduction into r.e.f. */
    int singularFlag = forwardElim(mat);

    /* if matrix is singular */
    if (singularFlag != -1) {
      print("Singular Matrix.\n");

      /* if the RHS of equation corresponding to
		zero row is 0, * system has infinitely
		many solutions, else inconsistent*/
      if (mat[singularFlag][3]) {
        print("Inconsistent System.");
      } else {
        print("May have infinitely many "
            "solutions.");
      }

      return;
    }

    /* get solution to system and print it using
	backward substitution */
    backSub(mat);
  }

// function for elementary operation of swapping two rows
  void swapRow(List mat, int i, int j) {
    //printf("Swapped rows %d and %d\n", i, j);

    for (int k = 0; k <= 3; k++) {
      double temp = mat[i][k];
      mat[i][k] = mat[j][k];
      mat[j][k] = temp;
    }
  }

// function to print matrix content at any stage
  void printfunc(List mat) {
    for (int i = 0; i < 3; i++, print("\n"))
      for (int j = 0; j <= 3; j++) print(mat[i][j]);

    print("\n");
  }

// function to reduce matrix to r.e.f.
  int forwardElim(List mat) {
    for (int k = 0; k < 3; k++) {
      // Initialize maximum value and index for pivot
      int iMax = k;
      double vMax = mat[iMax][k];

      /* find greater amplitude for pivot if any */
      for (int i = k + 1; i < 3; i++) {
        if (mat[i][k].abs() > vMax) {
          vMax = mat[i][k];
          iMax = i;
        }
      }

      /* if a prinicipal diagonal element is zero,
		// * it denotes that matrix is singular, and
		// * will lead to a division-by-zero later. */
      if (mat[k][iMax] == null) {
        return k;
      }
      // Matrix is singular

      /* Swap the greatest value row with current row */
      if (iMax != k) {
        swapRow(mat, k, iMax);
      }

      for (int i = k + 1; i < 3; i++) {
        /* factor f to set current row kth element to 0,
			// * and subsequently remaining kth column to 0 */
        double f = mat[i][k] / mat[k][k];

        /* subtract fth multiple of corresponding kth
			row element*/
        for (int j = k + 1; j <= 3; j++) {
          mat[i][j] -= mat[k][j] * f;
        }

        /* filling lower triangular matrix with zeros*/
        mat[i][k] = 0;
      }

      //print(mat);	 //for matrix state
    }
    //print(mat);		 //for matrix state
    return -1;
  }

// function to calculate the values of the unknowns
  void backSub(List mat) {
    List x = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ]; // An array to store solution

    /* Start calculating from last equation up to the
	first */
    for (int i = 3 - 1; i >= 0; i--) {
      /* start with the RHS of the equation */
      // print(x[i]);
      x[i] = mat[i][3];
      // print(x[i]);

      /* Initialize j to i+1 since matrix is upper
		triangular*/
      for (int j = i + 1; j < 3; j++) {
        /* subtract all the lhs values
			// * except the coefficient of the variable
			// * whose value is being calculated */
        x[i] -= mat[i][j] * x[j];
      }

      /* divide the RHS by the coefficient of the
		unknown being calculated */
      x[i] = x[i] / mat[i][i];
    }

    print("\nSolution for the system:\n");
    print(x[0]);
    print(x[1]);
    print(x[2]);
    xC = x[0];
    yC = x[1];
    zC = x[2];
    // for (int i = 0; i < 3; i++) {
    //   // x = x[i];
    //   // if () {

    //   // } else {
    //   // }
    //   print("$i ) $x[0]");
    //   print(x[i]);
    // }
  }

  double xC = 0;
  double yC = 0;
  double zC = 0;

// Driver program
  // void mainfunc() {
  //   /* input matrix */
  //   List mat = [
  //     [3.0, 2.0, -4.0, 3.0],
  //     [2.0, 3.0, 3.0, 15.0],
  //     [5.0, -3, 1.0, 14.0]
  //   ];
  //   gaussianElimination(mat);
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
    gaussianElimination(coeff);

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

  // bool calbtn = true;
  // String title1 = "";
  // String title2 = "";
  // String title3 = "";
  // String title4 = "";
  // String title5 = "";
  // String title6 = "";
  // String title7 = "";
  // String title8 = "";
  // String title9 = "";
  // String title10 = "";
  // String title11 = "";
  // String title12 = "";

  // String? s1;
  // String? s2;
  // String? s3;
  // String? s4;
  // String? s5;
  // String? s6;
  // String? s7;
  // String? s8;
  // String? s9;
  // String? s10;
  // String? s11;
  // String? s12;

  // void setText() {
  //   setState(() {
  //     calbtn = false;
  //     s1 = title1;
  //     s2 = title2;
  //     s3 = title3;
  //     s4 = title4;
  //     s5 = title5;
  //     s6 = title6;
  //     s7 = title7;
  //     s8 = title8;
  //     s9 = title9;
  //     s10 = title10;
  //     s11 = title11;
  //     s12 = title12;
  //     // mainfunc(s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12);
  //   });
  // }

  String errorText = "";
  void errorT() {
    setState(() {
      errorText = "X = $xC\nY = $yC\nZ = $zC";
    });
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
                "Guassian Elimination\n\nEnter the coefficients with there sign",
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
                        errorT();
                      }
                    : null,
                child: Text("Calculation"),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                errorText,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
