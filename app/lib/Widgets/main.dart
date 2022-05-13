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

  void _deletetx(String id){
    setState(() {
      _list.removeWhere((tx) => tx.id==id);
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
          //buttonTheme: ButtonTheme(TextStyle(color: Colors.white))
        ),
        home: Scaffold(
            appBar: AppBar( 
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
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                chart(_recentransaction),
                Transaction_List(_list,_deletetx)
              ]),
            ),
            floatingActionButton: Builder(
              builder: (cx) => FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () => startAddNewTransaction(cx)),
            )));
  }
}