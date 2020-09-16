import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({
    Key key,
  }) : super(key: key);

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    Map getDocs = document.data();
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              getDocs['name'],
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffddddff),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              getDocs["votes"].toString(),
            ),
          ),
        ],
      ),
      onTap: () {
        document.reference.update({'votes': getDocs['votes'] + 1});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Stream'),
      ),
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('bandnames').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading ...');
            return ListView.builder(
              itemExtent: 80.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
            );
          }),
    );
  }
}
