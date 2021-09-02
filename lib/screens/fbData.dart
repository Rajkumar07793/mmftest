import 'package:flutter/material.dart';
import 'package:mmftest/models/model.dart';
import 'package:provider/provider.dart';

class FbData extends StatelessWidget {
  const FbData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<MyModel>();
    return (data.data != null)
        ? Center(
            child: SizedBox(
              height: 400,
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                        data.data["picture"]["data"]["url"],
                        fit: BoxFit.fitWidth,
                      ),
                      Text(
                        data.data["name"],
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        data.data["email"],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
