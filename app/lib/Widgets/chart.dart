import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/Transaction.dart';
import './chartWidget.dart';

class chart extends StatelessWidget {
  final List<Transaction> recenttransactions;
  chart(this.recenttransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      double money = 0.0;
      for (var i = 0; i < recenttransactions.length; i++) {
        if (recenttransactions[i].date.day == weekday.day &&
            recenttransactions[i].date.month == weekday.month &&
            recenttransactions[i].date.year == weekday.year) {
          money += recenttransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekday));
      print(money);
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': money
      };
    }).reversed.toList();
  }

  double total = 0;
  double get totalspending {
    return groupedTransactionValues.fold(0.0, (total, item) {
      return total + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((tx) {
            return Flexible(
                fit: FlexFit.tight,
                child: chartprep(
                    tx['day'],
                    tx['amount'],
                    totalspending == 0
                        ? 0.0
                        : (tx['amount'] as double) / totalspending));
          }).toList(),
        ),
      ),
    );
  }
}
