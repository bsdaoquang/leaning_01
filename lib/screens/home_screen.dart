import 'package:flutter/material.dart';
import '../widgets/user_transaction.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // String titleInput = '';
  // String priceInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: const UserTransaction());
  }
}
