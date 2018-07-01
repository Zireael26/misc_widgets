import 'package:flutter/material.dart';

class AlertdialogDemo extends StatelessWidget {
  final String title;

  AlertdialogDemo(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: CustomBody(),
    );
  }
}

class CustomBody extends StatelessWidget {
  AlertDialog dialog = AlertDialog(
    content: Text("This is a custom Alert Dialog"),
    title: Text("Alert!"),
    actions: <Widget>[
      MaterialButton(
        child: Text("Dismiss"),
        onPressed: () {},
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MaterialButton(
            height: 48.0,
            child: Text("Gotta click 'em all"),
            onPressed: () {
              // To show an alert dialog
              showDialog(context: context, child: dialog);
            }),
      ),
    );
  }
}