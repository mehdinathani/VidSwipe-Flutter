import 'package:flutter/material.dart';
import 'package:storyteller/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Reels Demo', home: HomeView());
  }
}
