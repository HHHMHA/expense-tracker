// TODO: allow passing a transaction so we can update it
import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final void Function(Transaction transaction)? onSubmit;

  TransactionForm({required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                onSubmitted: (_) => submitData(),
              ),
              TextButton(
                onPressed: submitData,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (invalidInput()) {
      return;
    }

    Transaction transaction = Transaction(
      title: enteredTitle,
      amount: enteredAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    onSubmit!(transaction);
  }

  bool invalidInput() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    return enteredTitle.isEmpty || enteredAmount <= 0;
  }
}
