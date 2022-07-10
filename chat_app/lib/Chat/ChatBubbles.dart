import 'package:flutter/material.dart';

class Bubbles extends StatelessWidget {
  String Message;
  bool isme;
  Bubbles(this.Message, this.isme);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isme? MainAxisAlignment.end: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: isme ? Color.fromARGB(255, 90, 87, 87) : Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: !isme ? Radius.circular(0) : Radius.circular(12),
                bottomRight: isme ? Radius.circular(0) : Radius.circular(12),
              )),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            Message,
            style: TextStyle(
                color: Theme.of(context).accentTextTheme.titleMedium!.color),
          ),
        ),
      ],
    );
  }
}






























































































// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// class Bubbles extends StatelessWidget {
//   String Message;
//   bool isme;
//   String username;
//   Bubbles(this.Message, this.isme, this.username);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: isme ? MainAxisAlignment.end : MainAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Container(
//             decoration: BoxDecoration(
//                 color: isme
//                     ? Color.fromARGB(236, 83, 82, 82)
//                     : Theme.of(context).accentColor,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(12),
//                   topRight: Radius.circular(12),
//                   bottomLeft: !isme ? Radius.circular(0) : Radius.circular(12),
//                   bottomRight: isme ? Radius.circular(0) : Radius.circular(12),
//                 )),
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//             margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            
//               child: Column(
//                 children: [
//                   FutureBuilder(
//                     future: FirebaseFirestore.instance.collection('users').doc('userId').get(),
//                     builder: (context, snapshot) {
//                       if(snapshot.connectionState==ConnectionState.waiting){
//                         return(Text("Loading..."));
//                       }
//                       return Text(
//                        (
//                         // snapshot.data!.data())['Username']
//                         "Username"
//                       ));
//                     }
//                   ),
//                   Text(
//                     Message,
//                     style: TextStyle(
//                         color:
//                             Theme.of(context).accentTextTheme.titleMedium!.color),
//                   ),
//                 ],
//               ),
            
//           ),
//         ),
//       ],
//     );
//   }
// }
