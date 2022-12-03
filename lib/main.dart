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
        primarySwatch: Colors.pink,
        fontFamily: 'Nunito',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleSmall:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              titleMedium:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              titleLarge:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
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
