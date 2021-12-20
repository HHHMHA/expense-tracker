import 'package:expense_tracker/common/constants.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction transaction;
  final void Function(String id) deleteHandler;

  const TransactionWidget({
    required this.transaction,
    required this.deleteHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                '\$${transaction.amount.toStringAsFixed(Constants.defaultPrecession)}',
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(
            transaction.date,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => deleteHandler(transaction.id),
        ),
      ),
    );
  }
}
