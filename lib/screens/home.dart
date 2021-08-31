import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:mmftest/models/model.dart';
import 'package:mmftest/screens/bottomTab.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var data = context.watch<MyModel>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final LoginResult result = await FacebookAuth.instance.login(
                  permissions: [
                    'public_profile',
                    'email',
                    'pages_show_list',
                  ],
                ).then((value) {
                  FacebookAuth.instance.getUserData().then((value) {
                    setState(() {
                      data.data = value;
                      data.addData(value);
                      Provider.of<MyModel>(context, listen: false).data = value;
                    });
                  });
                  return value;
                });

                final AccessToken accessToken =
                    await FacebookAuth.instance.accessToken;
                if (accessToken != null) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BottomTab()));
                }
              },
              child: Text("Login with Facebook"),
            )
          ],
        ),
      ),
    );
  }
}
