import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransationsList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransationsList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 450,
        child: transactions.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No data transactions yet!',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/no_data.png',
                    width: 150,
                    fit: BoxFit.cover,
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: ((item, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Card(
                          elevation: 6,
                          child: ListTile(
                            title: Text(
                              transactions[index].title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            subtitle: Text(DateFormat.yMMMd()
                                .format(transactions[index].date)),
                            leading: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '\$${transactions[index].price.toStringAsFixed(0)}',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ),
                          )),
                    )),
                itemCount: transactions.length,
              ));
  }
}
