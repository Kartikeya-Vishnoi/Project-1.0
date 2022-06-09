// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: Firestore.instance
                .collection('chats/pBQt3cPcWGrzY1VtjEm9/messages')
                .snapshots(),
            builder: (ctx, AsyncSnapshot<QuerySnapshot> streamsnapshot) {
              if (streamsnapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final document = streamsnapshot.data?.documents;
              return ListView.builder(
                  itemCount: document?.length,
                  itemBuilder: (BuildContext context, int idx) {
                    return Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(document?[idx]['text']));
                  });
            }),
        floatingActionButton: FloatingActionButton(
            // ignore: prefer_const_constructors
            child: Icon(Icons.add),
            onPressed: () {
              Firestore.instance
                  .collection('chats/pBQt3cPcWGrzY1VtjEm9/messages')
                  .add({'text': 'HELLLLO THEIR!!!! :)'});
            }));
  }
}
