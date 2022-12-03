import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function addNewTransaction;

  const AddTransaction(this.addNewTransaction, {super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _titleControler = TextEditingController();
  final _priceControler = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    final inputTitle = _titleControler.text;
    final inputPrice =
        double.parse(_priceControler.text != '' ? _priceControler.text : '0.0');

    if (inputTitle.isEmpty || inputPrice <= 0) {
      return;
    }

    widget.addNewTransaction(inputTitle, inputPrice, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }

      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: ('Title')),
              controller: _titleControler,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Price'),
              controller: _priceControler,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Text('Date: ${DateFormat.yMd().format(_selectedDate)}'),
                  const SizedBox(
                    width: 16,
                  ),
                  TextButton(
                      onPressed: _presentDatePicker,
                      child: const Text('Choise date'))
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor),
              child: const Text(
                'Add new',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
