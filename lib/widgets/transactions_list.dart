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
                itemBuilder: ((item, index) => Card(
                        child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 2,
                                    style: BorderStyle.solid)),
                            child: Text(
                              '\$${transactions[index].price.toStringAsFixed(2)}',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nunito',
                                  fontSize: 20),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactions[index].title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              DateFormat.yMMMM()
                                  .format(transactions[index].date),
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ))),
                itemCount: transactions.length,
              ));
  }
}
