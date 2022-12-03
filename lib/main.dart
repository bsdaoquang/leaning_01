import 'package:flutter/material.dart';
import '/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        errorColor: Colors.red[400],
        fontFamily: 'Nunito',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'Nunito', fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: const HomeScreen(),
    );
  }
}
