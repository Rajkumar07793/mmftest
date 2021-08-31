import 'package:flutter/material.dart';
import 'package:mmftest/screens/fbData.dart';
import 'package:mmftest/screens/prime.dart';
import 'package:mmftest/screens/users.dart';

class BottomTab extends StatefulWidget {
  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int index = 0;
  List<Widget> screens = [Prime(), FbData(), Users()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Prime"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.repeat), label: "Users"),
        ],
      ),
      body: screens[index],
    );
  }
}
