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
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
              ),
              TextButton(
                onPressed: () {
                  Transaction transaction = Transaction(
                    title: titleController.text,
                    amount: double.parse(amountController.text),
                    date: DateTime.now(),
                    id: '1',
                  );
                  onSubmit!(transaction);
                },
                child: Text(
                  'Add TransactionList',
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
