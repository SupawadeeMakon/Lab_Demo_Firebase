import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// //  Firestore firestore = Firestore.instance;

//   StreamSubscription<QuerySnapshot> subscription;
//   List<DocumentSnapshot> snapshots;

//   @override
//   void initState(){
//     super.initState();
//     readFireStore();
//   }

//   Future readFireStore() async{
//     CollectionReference collectionReference = firestore.collection('Malayu');
//     subscription = await collectionReference.snapshots().listen((dataSnapshot){
//       snapshots = dataSnapshot.documents;

//       for(var snapshot in snapshots){
//         String title = snapshot.data['Title'];
//         String content = snapshot.data['Content'];

//         print('Title==>$title, Content ==> $content');
//       }
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}