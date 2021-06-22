import 'package:datech/view/GaussEliminationMethod.dart';
import 'package:datech/view/bisection.dart';
import 'package:datech/view/cramersrule.dart';
import 'package:datech/view/regulafalsimethods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Numarical App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CramerRule(),
                  ),
                );
              },
              child: Text("Cramer's Rule"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GaussEliminationMethod(),
                  ),
                );
              },
              child: Text("Gauss Elimination Method"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bisection()),
                );
              },
              child: Text("Bisection Method"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Regulafalsimethods()),
                );
              },
              child: Text("Regula Falsi Methods"),
            ),
          ],
        ),
      ),
    );
  }
}
