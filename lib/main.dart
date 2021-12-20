import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/transaction_form.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'common/constants.dart';
import 'common/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      theme: Themes.mainTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: "1", title: "New Shoes", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "2", title: "New Milk", amount: 1000.99, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    final lastNonRecentTransactionDate = DateTime.now().subtract(
      Duration(days: Constants.RECENT_TRANSACTIONS_NUMBER),
    );
    return _transactions
        .where(
          (transaction) => transaction.date.isAfter(
            lastNonRecentTransactionDate,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.appTitle,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddTransactionForm(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Chart(
                  recentTransactions: _recentTransactions,
                ),
                elevation: Styles.chartCardElevation,
              ),
            ),
            TransactionList(
              transactions: _transactions,
              deleteHandler: _deleteTransaction,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddTransactionForm(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _showAddTransactionForm(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: TransactionForm(onSubmit: (transaction) {
              setState(() {
                _transactions.add(transaction);
              });
            }),
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() => _transactions.removeWhere((element) => element.id == id));
  }
}
