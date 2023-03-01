import 'package:flutter/material.dart';
import 'package:project/api/api_service.dart';
import 'package:project/screens/postsScreen/posts_page.dart';
import 'package:project/screens/postsScreen/posts_provider.dart';
import 'package:project/screens/userscreen/users_page.dart';
import 'package:project/screens/userscreen/users_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  var data = await ApiService.fetchPosts();
  print(data);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (BuildContext context) => UserProvider()),
      ChangeNotifierProvider(create: (BuildContext context) => PostProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserScreen());
  }
}
