import 'package:flutter/material.dart';
import 'base_screens.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ListProvider>(
      create: (context) => ListProvider(), child: MyApp(),));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<ListProvider>(
          create: (context) => ListProvider(), child: BaseScreen(title: '',description: '',)),
    );
  }
}
