import 'package:flutter/material.dart';

class MyModel extends ChangeNotifier {
  dynamic data;
  // List<bool> selected;

  void addData(data) {
    this.data = data;
    notifyListeners();
  }

  // void addSelected(selected) {
  //   this.selected = selected;
  //   notifyListeners();
  // }
}
