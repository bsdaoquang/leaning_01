import 'package:flutter/material.dart';
import '../widgets/chart.dart';
import '../widgets/add_transaction.dart';
import '../models/transaction.dart';
import '../widgets/transactions_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Transaction> _transactions = [
    // Transaction(id: '1', title: 'New shose', price: 6.99, date: DateTime.now()),
    // Transaction(
    //     id: '2', title: 'Transaction 2', price: 109.00, date: DateTime.now()),
    // Transaction(
    //     id: '3', title: 'Transaction 3', price: 19.99, date: DateTime.now())
  ];

  // Hàm thêm giao dịch
  void _addNewTransaction(String title, double price, DateTime choiceDate) {
    final newTransation = Transaction(
        id: DateTime.now().toString(),
        title: title,
        price: price,
        date: choiceDate);

    setState(() {
      _transactions.add(newTransation);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: AddTransaction(_addNewTransaction),
          );
        });
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((element) {
      return element.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  // String titleInput = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
          actions: [
            IconButton(
                onPressed: () => _startAddNewTransaction(context),
                icon: const Icon(Icons.add)),
          ],
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context)),
        body: Column(
          children: [
            Chart(_recentTransactions),
            TransationsList(_transactions)
          ],
        ));
  }
}
