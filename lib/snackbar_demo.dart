import 'package:flutter/material.dart';

class SnackBarDemo extends StatelessWidget {
  final String title;

  SnackBarDemo(this.title);

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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MaterialButton(
            height: 48.0,
            child: Text("Gotta click 'em all"),
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('I was clicked'),
                    duration: Duration(milliseconds: 3000),
                  ));
            }),
      ),
    );
  }
}