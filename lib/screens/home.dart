import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                FacebookAuth.instance.webInitialize(
                  appId: "296063998944959",
                  cookie: true,
                  xfbml: true,
                  version: "v11.0",
                );
                print("Auth");
                FacebookAuth.i.expressLogin();
                final token = FacebookAuth.getInstance().accessToken;
                print(token);
                setState(() async {
                  data = await FacebookAuth.instance.getUserData();
                });
                FacebookAuth.instance.login();
              },
              child: Text("Login with Facebook"),
            ),
            if (data != null) Text(data.toString()),
            if (data != null) Text(data["email"].toString())
          ],
        ),
      ),
    );
  }
}

String prettyPrint(Map json) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}
