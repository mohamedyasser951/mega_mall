import 'package:flutter/material.dart';
import 'package:mega_mall/config/theme.dart';
import 'package:mega_mall/features/home/presentation/pages/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: HomePage(),
    );
  }
}