import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChooseMentor extends StatefulWidget {
  // const ChooseMentor({Key? key}) : super(key: key);

  @override
  _ChooseMentorState createState() => _ChooseMentorState();
}

class _ChooseMentorState extends State<ChooseMentor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('mentor').snapshots(),
          builder:
              (BuildContext context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            } else if(snapshot.hasData || snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    QueryDocumentSnapshot? documentSnapshot =
                        snapshot.data?.docs[index];
                    return Card(
                      child: ListTile(
                        title: Text(documentSnapshot != null?(documentSnapshot['nama']):''),
                        subtitle: Text(documentSnapshot != null?(documentSnapshot['harga']):''),
                      ),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ),
            );
          }
          ),
    );
  }
}