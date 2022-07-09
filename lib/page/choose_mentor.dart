import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorskill/component/custom_list_item.dart';
import 'package:mentorskill/page/payment.dart';
import 'package:mentorskill/page/view_mentor.dart';

class ChooseMentor extends StatefulWidget {
  const ChooseMentor({Key? key, required this.select}) : super(key: key);

  final String select;

  @override
  _ChooseMentorState createState() => _ChooseMentorState();
}

class _ChooseMentorState extends State<ChooseMentor> {
  //style
  TextStyle style = TextStyle(color: Colors.blue, fontSize: 15);
  TextStyle style3 = TextStyle(fontSize: 20, color: Colors.white);
  //variabel
  int selectedMentor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Payment()));
        },
        child: Text(
          'Bayar',
          style: GoogleFonts.poppins(textStyle: style3),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
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
                    return Card(
                        child: CustomListItem(
                      photo: Icon(Icons.person),
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
                      radioBut: Radio(
                        value: index,
                        groupValue: selectedMentor,
                        activeColor: Colors.black,
                        onChanged: (value) {
                          setState(() {
                            selectedMentor = value!.toInt();
                          });
                          print(value);
                        },
                      ),
                      view: RichText(
                        text: TextSpan(
                            text: 'View',
                            style: GoogleFonts.poppins(textStyle: style),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                if (selectedMentor != index) {
                                  var errorSnackBar = SnackBar(
                                    duration: Duration(milliseconds: 700),
                                    content: Text('Pilih Mentor untuk melihat'),
                                    backgroundColor: Colors.red,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(errorSnackBar);
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ViewMentor(
                                                selectedMajor: widget.select,
                                                selectedMentor: selectedMentor,
                                              )));
                                }
                              }),
                      ),
                    ));
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
