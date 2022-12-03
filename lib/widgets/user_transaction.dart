import 'package:flutter/cupertino.dart';
import 'package:leaning_01/widgets/add_transaction.dart';
import '../models/transaction.dart';
import '../widgets/transactions_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(id: '1', title: 'New shose', price: 6.99, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Transaction 2', price: 109.00, date: DateTime.now()),
    Transaction(
        id: '3', title: 'Transaction 3', price: 19.99, date: DateTime.now())
  ];

  // Hàm thêm giao dịch
  void _addNewTransaction(String title, double price) {
    final newTransation = Transaction(
        id: DateTime.now().toString(),
        title: title,
        price: price,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransation);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AddTransaction(_addNewTransaction),
          TransationsList(_transactions),
        ],
      ),
    );
  }
}
