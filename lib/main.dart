import 'package:flutter/material.dart';
import 'snackbar_demo.dart';
import 'alertdialog_demo.dart';
import 'bottom_nav_bar_demo.dart';

void main() => runApp(new MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        splashColor: Colors.pink[200],
      ),
      home: new HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Abhishek Kaushik"),
              accountEmail: Text("abhishek.nexus26@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Text("AK"),
                backgroundColor: Colors.orangeAccent,
              ),
            ),
            ListTile(
              title: Text("Stepper Demo"),
              leading: Icon(Icons.linear_scale),
              selected: true,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("SnackBar Demo"),
              leading: Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new SnackBarDemo("SnackBar")));
              },
            ),
            ListTile(
              title: Text("AlertDialog Demo"),
              leading: Icon(Icons.question_answer),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new AlertdialogDemo("AlertDialog")));
              },
            ),
            ListTile(
              title: Text("BottomNavBar Demo"),
              leading: Icon(Icons.swap_horiz),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                    new BottomNavBarDemo()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Utils App'),
      ),
      body: Stepper(
        steps: <Step>[
          Step(
            title: Text("First Step"),
            content: Text("Lorem ipsum dolor sit amet"),
            isActive: true,
          ),
          Step(
            title: Text("Second Step"),
            content: Text("Lorem ipsum dolor sit amet"),
            isActive: true,
          ),
          Step(
            title: Text("Third Step"),
            content: Text("Lorem ipsum dolor sit amet"),
            isActive: true,
          )
        ],
        type: StepperType.vertical,
        currentStep: this.currentStep,
        onStepContinue: () {
          currentStep += 1;
        },
      ),
    );
  }
}