import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return TransactionWidget(transaction: transactions[index]);
        },
        itemCount: transactions.length,
      ),
    );
  }
}
