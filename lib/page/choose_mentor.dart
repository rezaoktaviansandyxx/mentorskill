import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mentorskill/component/custom_list_item.dart';
import 'package:mentorskill/page/view_mentor.dart';

// ignore: must_be_immutable
class ChooseMentor extends StatelessWidget {
  ChooseMentor({Key? key, required this.select}) : super(key: key);
  final String select;
  //style
  TextStyle style = const TextStyle(color: Colors.blue, fontSize: 15);
  TextStyle style3 = const TextStyle(fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('mentor')
              .where('id_major', isEqualTo: select)
              .snapshots(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
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
                                  selectedMajor: select,
                                  selectedMentor: index))),
                      child: Card(
                          child: CustomListItem(
                        photo: Image.network(documentSnapshot!['foto']),
                        name: documentSnapshot.exists
                            ? (documentSnapshot['nama'])
                            : '',
                        job: documentSnapshot.exists
                            ? (documentSnapshot['kerja'])
                            : '',
                        rate: documentSnapshot.exists
                            ? (documentSnapshot['rating'])
                            : '',
                        reviews: documentSnapshot.exists
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
