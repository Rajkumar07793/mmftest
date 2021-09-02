import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mmftest/screens/selectedUsers.dart';

class Users extends StatefulWidget {
  const Users({Key key}) : super(key: key);

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List users = [];
  List<bool> isChecked = [];
  int total_pages = 0;
  int currentPage = 1;

  @override
  void initState() {
    getUserList();
    super.initState();
  }

  getUserList() async {
    final Uri url = Uri.parse("https://reqres.in/api/users?page=$currentPage");
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      dynamic res = json.decode(response.body);
      setState(() {
        users = res['data'];
        // users.add(res['data']);
        total_pages = res["total_pages"];
        isChecked = List<bool>.filled(users.length, false);
      });
    } else {
      throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UsersSelected(
                selectedUsers: users,
                isChecked: isChecked,
              ),
            ),
          );
        },
        child: Icon(Icons.arrow_forward_ios_outlined),
      ),
      body: PageView(
        onPageChanged: (i) {
          setState(() {
            currentPage = i + 1;
            getUserList();
          });
        },
        children: [
          for (int i = 0; i < total_pages; i++)
            ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Image.network(
                      users[index]["avatar"],
                    ),
                  ),
                  title: Text(
                    users[index]["first_name"] + users[index]["last_name"],
                  ),
                  subtitle: Text(
                    users[index]["email"],
                  ),
                  trailing: Checkbox(
                    value: isChecked[index],
                    onChanged: (v) {
                      setState(() {
                        isChecked[index] = v;
                      });
                    },
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
