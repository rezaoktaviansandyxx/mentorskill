import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorskill/model/user_model.dart';
import 'package:mentorskill/page/class_menu2.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ClassMenu extends StatefulWidget {
  ClassMenu({Key? key}) : super(key: key);

  @override
  State<ClassMenu> createState() => _ClassMenuState();
}

class _ClassMenuState extends State<ClassMenu> {
  TextStyle style = TextStyle(fontSize: 20);
  TextStyle style2 = TextStyle(fontSize: 18);
  TextStyle style3 = TextStyle(fontSize: 15);

  //firebase
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel(saldo: 0);

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.blue,
          ],
        ),
      ),
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('majors')
              .doc('${loggedInUser.id_major}')
              .collection('menuclass')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.active) {
              return const Center(child: CircularProgressIndicator());
            }
            QueryDocumentSnapshot? documentSnapshot = snapshot.data?.docs[0];
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 6,
                          child: Text(
                            // '1. Dasar-dasar Teknologi',
                            ('1. ' + documentSnapshot!['judul']),
                            style: GoogleFonts.poppins(textStyle: style),
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          child: LinearProgressIndicator(
                            value: 0.2,
                            color: Colors.blueAccent,
                            backgroundColor: Colors.grey,
                            minHeight: 10,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      // '- Pengenalan android development',
                      ('- ' + documentSnapshot['tahap1']),
                      style: GoogleFonts.poppins(textStyle: style2),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          launchUrlString(documentSnapshot['tahap1pdf']);
                        },
                        child: Text(
                          'Lihat PDF',
                          style: GoogleFonts.poppins(textStyle: style3),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      // '- Java & Kotlin',
                      ('- ' + documentSnapshot['tahap2']),
                      style: GoogleFonts.poppins(textStyle: style2),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          launchUrlString(documentSnapshot['tahap2pdf']);
                        },
                        child: Text(
                          'Lihat PDF',
                          style: GoogleFonts.poppins(textStyle: style3),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      // '- Object oriented programming(OOP)',
                      ('- ' + documentSnapshot['tahap3']),
                      style: GoogleFonts.poppins(textStyle: style2),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          launchUrlString(documentSnapshot['tahap3pdf']);
                        },
                        child: Text(
                          'Lihat PDF',
                          style: GoogleFonts.poppins(textStyle: style3),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      // '- Video Pembelajaran',
                      ('- ' + documentSnapshot['tahap4']),
                      style: GoogleFonts.poppins(textStyle: style2),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          launchUrlString(documentSnapshot['tahap4video']);
                        },
                        child: Text(
                          'Lihat Video',
                          style: GoogleFonts.poppins(textStyle: style3),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ClassMenu2()));
                        },
                        icon: Icon(
                          Icons.arrow_forward_rounded,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
