import 'package:expense_tracker/common/constants.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({required this.recentTransactions});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(Constants.RECENT_TRANSACTIONS_NUMBER, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      final double weekDayTotalTransactionsValue = recentTransactions
          .where((transaction) => transaction.date == weekDay)
          .fold(0, (previousValue, element) => previousValue + element.amount);
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': weekDayTotalTransactionsValue,
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0, (previousValue, element) {
      double amount = element['amount'] as double;
      return previousValue + amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            final spendingPercentage = totalSpending == 0.0
                ? 0.0
                : (data['amount'] as double) / totalSpending;
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(data['day'] as String, data['amount'] as double,
                  spendingPercentage),
            );
          }).toList(),
        ),
      ),
    );
  }
}
