import 'package:expense_tracker/common/constants.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String id) deleteHandler;

  const TransactionList(
      {required this.transactions, required this.deleteHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Styles.transactionListContainerHeight,
      child: Conditional.single(
        context: context,
        conditionBuilder: (context) => transactions.isNotEmpty,
        widgetBuilder: (context) => ListView.builder(
          itemBuilder: (ctx, index) {
            return TransactionWidget(
              transaction: transactions[index],
              deleteHandler: deleteHandler,
            );
          },
          itemCount: transactions.length,
        ),
        fallbackBuilder: (context) => Column(
          children: [
            Text(
              Messages.noTransactionsMessage,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: Styles.sizedBoxHeight,
            ),
            Container(
              height: Styles.noTransactionsImageHeight,
              child: Image.asset(
                Images.waitingImage,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
