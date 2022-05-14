import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Widgets/Transaction_lists.dart';
import 'package:flutter_complete_guide/Widgets/chart.dart';
import 'package:flutter_complete_guide/Widgets/new_transactions.dart';

import '../models/Transaction.dart';
import './new_transactions.dart';
import './chart.dart';

void main() {
  runApp(app_2());
}

class app_2 extends StatefulWidget {
  @override
  State<app_2> createState() => _app_2State();
}

class _app_2State extends State<app_2> {
  final List<Transaction> _list = [];
  List<Transaction> get _recentransaction {
    return _list.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addnextx(String txtitle, double txamount, DateTime chosendate) {
    Transaction _tx = new Transaction(
        id: "${DateTime.now()}",
        title: txtitle,
        amount: txamount,
        date: chosendate);
    setState(() {
      _list.add(_tx);
    });
  }

  void _deletetx(String id) {
    setState(() {
      _list.removeWhere((tx) => tx.id == id);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet<void>(
        context: ctx,
        builder: (_) {
          return New_Transactions(_addnextx);
        });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        "My Expenses",
      ),
      actions: [
        Builder(builder: (co) {
          return IconButton(
              onPressed: () {
                startAddNewTransaction(co);
              },
              icon: Icon(Icons.add));
        })
      ],
    );
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          errorColor: Colors.red,
          fontFamily: "QuickSand",
          textTheme: TextTheme(
            headline6: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        home: Scaffold(
            appBar: appBar,
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Builder(builder: (context) {
                      return Container(
                          height: (MediaQuery.of(context).size.height -
                                  appBar.preferredSize.height -
                                  MediaQuery.of(context).padding.top -
                                  MediaQuery.of(context).padding.bottom -
                                  kToolbarHeight) *
                              0.3,
                          child: chart(_recentransaction));
                    }),
                    Builder(builder: (context) {
                      return Container(
                          height: (MediaQuery.of(context).size.height -
                                  appBar.preferredSize.height -
                                  MediaQuery.of(context).padding.top -
                                  MediaQuery.of(context).padding.bottom -
                                  kToolbarHeight) *
                              0.7,
                          child: Transaction_List(_list, _deletetx));
                    })
                  ]),
            ),
            floatingActionButton: Builder(
              builder: (cx) => FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () => startAddNewTransaction(cx)),
            )));
  }
}
