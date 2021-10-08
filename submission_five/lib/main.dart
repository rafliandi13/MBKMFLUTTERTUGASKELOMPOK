import 'package:flutter/material.dart';
import 'base_screens.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListProvider(),
      child: MaterialApp(
        title: "State Management",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: BaseScreen(),
      ),
    );
  }
}
