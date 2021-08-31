import 'package:flutter/material.dart';

class MyModel extends ChangeNotifier {
  dynamic data = {
    "name": "Open Graph Test User",
    "email": "open_jygexjs_user@tfbnw.net",
    "picture": {
      "data": {
        "height": 126,
        "url":
            "https://scontent.fuio21-1.fna.fbcdn.net/v/t1.30497-1/s200x200/84628273_176159830277856_972693363922829312_n.jpg",
        "width": 200
      }
    },
    "id": "136742241592917"
  };

  void addData(data) {
    this.data = data;
    notifyListeners();
  }
}
