import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Conditional.single(
        context: context,
        conditionBuilder: (context) => transactions.isNotEmpty,
        widgetBuilder: (context) => ListView.builder(
          itemBuilder: (ctx, index) {
            return TransactionWidget(
              transaction: transactions[index],
            );
          },
          itemCount: transactions.length,
        ),
        fallbackBuilder: (context) => Column(
          children: [
            Text(
              'No transactions added yet',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
