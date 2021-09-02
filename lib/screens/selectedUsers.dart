import 'package:flutter/material.dart';

class UsersSelected extends StatelessWidget {
  final List selectedUsers;
  final List<bool> isChecked;
  UsersSelected({Key key, this.selectedUsers, this.isChecked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: selectedUsers.length,
          itemBuilder: (context, index) {
            if (isChecked[index]) {
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(selectedUsers[index]["avatar"]),
                ),
                title: Text(selectedUsers[index]["first_name"] +
                    selectedUsers[index]["last_name"]),
                subtitle: Text(selectedUsers[index]["email"]),
              );
            } else {
              return SizedBox(height: 0);
            }
          }),
    );
  }
}
