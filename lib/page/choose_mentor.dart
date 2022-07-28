import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentorskill/component/custom_list_item.dart';
import 'package:mentorskill/page/view_mentor.dart';

class ChooseMentor extends StatefulWidget {
  const ChooseMentor({Key? key, required this.select}) : super(key: key);

  final String select;
  // final String selectedMajor;

  @override
  _ChooseMentorState createState() => _ChooseMentorState();
}

class _ChooseMentorState extends State<ChooseMentor> {
  //style
  TextStyle style = TextStyle(color: Colors.blue, fontSize: 15);
  TextStyle style3 = TextStyle(fontSize: 20, color: Colors.white);
  //variabel
  // int selectedMentor = 0;
  // String selectedMentor = 'mentor_1';
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('mentor')
              .where('id_major', isEqualTo: widget.select)
              .snapshots(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            } else if (snapshot.hasData || snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    QueryDocumentSnapshot? documentSnapshot =
                        snapshot.data?.docs[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewMentor(
                                  selectedMajor: widget.select,
                                  selectedMentor: index))),
                      child: Card(
                          child: CustomListItem(
                        photo: Image.network(documentSnapshot!['foto']),
                        name: documentSnapshot != null
                            ? (documentSnapshot['nama'])
                            : '',
                        job: documentSnapshot != null
                            ? (documentSnapshot['kerja'])
                            : '',
                        rate: documentSnapshot != null
                            ? (documentSnapshot['rating'])
                            : '',
                        reviews: documentSnapshot != null
                            ? (documentSnapshot['review'])
                            : '',
                      )),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ),
            );
          }),
    );
  }
}
