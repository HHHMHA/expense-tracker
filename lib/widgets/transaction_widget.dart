import 'package:expense_tracker/common/constants.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/ui/border_box.dart';
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
          BorderBox(
            child: Text(
              '\$${transaction.amount.toStringAsFixed(Constants.defaultPrecession)}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              transaction.title,
              style: TextStyle(
                fontSize: Styles.defaultFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
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
