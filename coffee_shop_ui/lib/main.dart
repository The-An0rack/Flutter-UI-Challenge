import 'package:flutter/material.dart';

import 'screens/homepage.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Coffee Brewry",
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
