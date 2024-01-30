import 'package:flutter/material.dart';
import 'package:note_app/core/themes/light_theme.dart';
import 'package:note_app/presentation/screens/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: lightTheme,
      home: const HomePage(),
    );
  }
}
