import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chat extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int idx) {
            return Container(
                padding: EdgeInsets.all(8), child: Text("HELLO THEIR!!"));
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Firestore.instance
              .collection('chats/F9LvbXDnwAA1fURowYPk/messages')
              .snapshots()
              .listen((data) {
            // print(data.documents[0]['text']);
            data.documents.forEach((document) {
              print(document['text']);
             });
          });
        },
      ),
    );
  }
}