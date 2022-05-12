import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/Transaction.dart';

class Transaction_List extends StatelessWidget {
  final List<Transaction> list;
  Transaction_List(this.list);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: list.isEmpty
            ? Column(
                children: [
                  Text(
                    "No Transactions added Yet!!",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset(
                        "assets/fonts/Images/waiting.png",
                        fit: BoxFit.cover,
                      ))
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical:8 ,horizontal:5 ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                      child:Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(  child: Text("\$${list[index].amount}"),),
                      )
                      ),
                      title: Text(list[index].title, style:Theme.of(context).textTheme.titleMedium),
                      subtitle: Text(DateFormat.yMMMd().format(list[index].date)),                 
                    ),
                  );
                },
                itemCount: list.length));
  }
}
