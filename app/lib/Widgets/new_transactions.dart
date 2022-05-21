import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './main.dart';

class New_Transactions extends StatefulWidget {
  final Function func;
  New_Transactions(this.func);

  @override
  State<New_Transactions> createState() => _New_TransactionsState();
}

class _New_TransactionsState extends State<New_Transactions> {
  final titleController = TextEditingController();
  final AmountController = TextEditingController();
  DateTime _selecteddate;

  void submit() {
    final double amt = double.parse(AmountController.text);
    final String txtitle = titleController.text;
    if (AmountController.text.isEmpty) {
      return;
    }
    if (amt <= 0 || txtitle.length == 0 || _selecteddate == null) {
      return;
    }
    widget.func(txtitle, amt, _selecteddate);
    Navigator.of(context).pop();
  }

  void datepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickeddate) {
      if (pickeddate == null) {
        return;
      } else {
        setState(() {
          _selecteddate = pickeddate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => submit,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: AmountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submit,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Flexible(
                    child: Text(_selecteddate == null
                        ? "No Date Choosen"
                        : DateFormat.yMd().format(_selecteddate)),
                    fit: FlexFit.tight,
                  ),
                  FlatButton(
                    onPressed: datepicker,
                    child: Text(
                      "Choose a Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).buttonColor,
              onPressed: submit,
              child: Text("Add Transaction"),
            ),
          ],
        ),
      )),
    );
  }
}
