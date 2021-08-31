import 'package:flutter/material.dart';

class Prime extends StatefulWidget {
  const Prime({Key key}) : super(key: key);

  @override
  _PrimeState createState() => _PrimeState();
}

class _PrimeState extends State<Prime> {
  int i, j, flag;
  List<int> p = [];

  @override
  void initState() {
    prime();
    super.initState();
  }

  prime() {
    for (i = 1; i <= 541; i++) {
      if (i == 1 || i == 0) continue;

      flag = 1;

      for (j = 2; j <= i / 2; ++j) {
        if (i % j == 0) {
          flag = 0;
          break;
        }
      }
      if (flag == 1) p.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
      children: [
        for (int i = 0; i < p.length; i++)
          Container(
            color: Colors.amberAccent,
            child: Center(child: Text(p[i].toString())),
          )
      ],
    );
  }
}
