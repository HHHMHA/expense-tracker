import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction transaction;

  const TransactionWidget({
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple,
                  width: 2,
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                '\$${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.purple,
                ),
              )),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(transaction.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
            Text(
              DateFormat.yMMMd().format(transaction.date),
              style: TextStyle(color: Colors.grey),
            ),
          ]),
        ],
      ),
    );
  }
}
