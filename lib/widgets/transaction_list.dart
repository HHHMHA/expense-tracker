import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map((transaction) {
      return TransactionWidget(transaction: transaction);
    }).toList());
  }
}
