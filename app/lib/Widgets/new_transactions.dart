import 'package:flutter/material.dart';
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

  void submit() {
    final double amt = double.parse(AmountController.text);
    final String txtitle = titleController.text;
    if (amt <= 0 || txtitle.length == 0) {
      return;
    }
    widget.func(txtitle, amt);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
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
                Text("No Date Choosen"),
                FlatButton(
                  onPressed: () {},
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
            textColor:Theme.of(context).buttonColor
            onPressed: submit,
            child: Text("Add Transaction"),
            textColor: Colors.purple,
          ),
        ],
      ),
    ));
  }
}
