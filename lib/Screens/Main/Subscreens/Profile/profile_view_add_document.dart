import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileViewScreenFireBase extends StatelessWidget {
  final databaseReference = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FireStore Demo'),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            child: Text('Create Record'),
            onPressed: () {
              createRecord();
            },
          ),
          RaisedButton(
            child: Text('View Record'),
            onPressed: () {
              getData();
            },
          ),
          RaisedButton(
            child: Text('Update Record'),
            onPressed: () {
              updateData();
            },
          ),
          RaisedButton(
            child: Text('Delete Record'),
            onPressed: () {
              deleteData();
            },
          ),
        ],
      )), //center
    );
  }

  void createRecord() async {
    await databaseReference.collection('users').doc('777777').set({
      'phone': '994174969',
      'email': 'akbarpulatov7@gmail.com',
      'name': 'Akbar'
    });

    // DocumentReference ref = await databaseReference.collection("books").add({
    //   'title': 'Flutter in Action',
    //   'description': 'Complete Programming Guide to learn Flutter'
    // });
    // print(ref.id);
  }

  void getData() {
    databaseReference.collection("users").get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((f) => print('${f.data}}'));
    });
  }

  void updateData() {
    try {
      databaseReference
          .collection('users')
          .doc('777777')
          .update({'name': 'Akbar Pulatov'});
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteData() {
    try {
      databaseReference.collection('users').doc('123456').delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
