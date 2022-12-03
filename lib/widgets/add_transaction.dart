import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final Function addNewTransaction;
  final titleControler = TextEditingController();
  final priceControler = TextEditingController();

  AddTransaction(this.addNewTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: ('Title')),
            controller: titleControler,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Price'),
            controller: priceControler,
            keyboardType: TextInputType.number,
          ),
          TextButton(
              onPressed: () {
                addNewTransaction(
                    titleControler.text, double.parse(priceControler.text));
              },
              child: const Text(
                'Add new',
                style: TextStyle(color: Colors.purple),
              ))
        ],
      ),
    );
  }
}
