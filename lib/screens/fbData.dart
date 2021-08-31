import 'package:flutter/material.dart';
import 'package:mmftest/models/model.dart';
import 'package:provider/provider.dart';

class FbData extends StatelessWidget {
  const FbData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<MyModel>();
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(data.data["picture"]["data"]["url"]),
            Text("Name: " + data.data["name"]),
            Text("Email: " + data.data["email"]),
          ],
        ),
      ),
    );
  }
}
