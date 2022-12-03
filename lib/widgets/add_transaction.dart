import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final Function addNewTransaction;
  final titleControler = TextEditingController();
  final priceControler = TextEditingController();

  AddTransaction(this.addNewTransaction, {super.key});

  void submitData() {
    final inputTitle = titleControler.text;
    final inputPrice =
        double.parse(priceControler.text != '' ? priceControler.text : '0.0');

    if (inputTitle.isEmpty || inputPrice <= 0) {
      return;
    }

    addNewTransaction(inputTitle, inputPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: ('Title')),
            controller: titleControler,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Price'),
            controller: priceControler,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          TextButton(
              onPressed: submitData,
              child: const Text(
                'Add new',
                style: TextStyle(color: Colors.purple),
              ))
        ],
      ),
    );
  }
}
