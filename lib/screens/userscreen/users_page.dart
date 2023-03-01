import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project/models/user_model.dart';
import 'package:project/screens/userscreen/users_provider.dart';
import 'package:provider/provider.dart';

import '../postsScreen/posts_provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<User>>(
      future: Provider.of<UserProvider>(context).fetchUsersData(),
      builder: ((context, snapshot) {
        if (snapshot.hasData || ConnectionState == ConnectionState.done) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                User user = snapshot.data![index];
                return UiWidget(user: user);
              });
        } else if (ConnectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    ));
  }
}

class UiWidget extends StatelessWidget {
  UiWidget({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width, 100)),
      onPressed: () {},
      child: ListTile(
        leading: Text(user.id.toString()),
        title: Text(user.username.toString()),
        trailing: Text(user.email.toString()),
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  ErrorWidget({required this.object, super.key});

  final Object object;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircularProgressIndicator(),
    );
  }
}
