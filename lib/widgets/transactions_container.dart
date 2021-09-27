import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/transaction_form.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionsContainer extends StatefulWidget {
  @override
  _TransactionsContainerState createState() => _TransactionsContainerState();
}

class _TransactionsContainerState extends State<TransactionsContainer> {
  final List<Transaction> _transactions = [
    Transaction(
        id: "1", title: "New Shoes", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "2", title: "New Milk", amount: 1000.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(onSubmit: (transaction) {
          setState(() {
            _transactions.add(transaction);
          });
        }),
        TransactionList(
          transactions: _transactions,
        )
      ],
    );
  }
}
