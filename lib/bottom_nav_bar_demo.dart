import 'package:flutter/material.dart';

class BottomNavBarDemo extends StatefulWidget {
  BottomNavBarDemo();

  @override
  _BottomNavBarDemoState createState() => _BottomNavBarDemoState();
}

class _BottomNavBarDemoState extends State<BottomNavBarDemo>
    with SingleTickerProviderStateMixin {

  // Index to set the selected item when the content is loaded
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomNavigationBar"),
      ),
      // A Stack to keep all screens drawn, on top of one another
      body: Stack(
        children: <Widget>[
          // Depending on the values of offstage and tickermode enabled ( true or false ),
          // we can show or hide any particular screen from the stack
          Offstage(
            offstage: index != 0, // if index is not 0, don't show this
            child: TickerMode(
              enabled: index == 0, // if index is 0, show this
              child: NewPage("First"), // Can be replaced with any custom content
            ),
          ),
          Offstage(
            offstage: index != 1,
            child: TickerMode(
              enabled: index == 1,
              child: NewPage("Second"),
            ),
          ),
          Offstage(
            offstage: index != 2,
            child: TickerMode(
              enabled: index == 2,
              child: NewPage("Third"),
            ),
          ),
        ],
      ),

      // Implementation of the Bottom NavigationBar
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.pink,
        currentIndex: index,
        // type can be fixed or shifting, depending on preference
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          // list of items in the BottomNavigationBar (like menu.xml)
          BottomNavigationBarItem(
            title: Text("First"),
            icon: Icon(Icons.dashboard),
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            title: Text("Second"),
            icon: Icon(Icons.question_answer),
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            title: Text("Third"),
            icon: Icon(Icons.notifications),
            backgroundColor: Colors.teal,
          ),
        ],

        // when  an item is tapped, the selected index is updated to the variable,
        // to show/hide various screens
        onTap: (int selected) {
          setState(() {
            this.index = selected;
          });
        },
      ),
    );
  }
}

// the custom page that is displayed when an item is selected
class NewPage extends StatelessWidget {
  final String title;

  NewPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(title)),
    );
  }
}