import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorskill/model/user_model.dart';
import 'package:mentorskill/page/payment.dart';

class ViewMentor extends StatelessWidget {
  ViewMentor(
      {Key? key, required this.selectedMajor, required this.selectedMentor})
      : super(key: key);
  //Style
  final style1 = const TextStyle(fontSize: 20);
  final style2 = const TextStyle(fontSize: 20, color: Colors.blue);
  final style3 = const TextStyle(fontSize: 16, color: Colors.blue);

  final String selectedMajor;
  final int selectedMentor;
  String documentId = '';

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 20, color: Colors.white);

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('mentor')
            .where('id_major', isEqualTo: selectedMajor)
            .snapshots(),
        builder: (context, snapshot) {
          QueryDocumentSnapshot? documentSnapshot =
              snapshot.data?.docs[selectedMentor];
          documentId = documentSnapshot!.get('id_mentor');
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData || snapshot.data != null) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.35),
                child: AppBar(
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage((documentSnapshot['foto'])),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(color: Colors.green, spreadRadius: 3),
                            ],
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            (documentSnapshot != null
                                                ? (documentSnapshot['nama'])
                                                : ''),
                                            style: GoogleFonts.poppins(
                                                textStyle: style1),
                                          ),
                                          Text(
                                            (documentSnapshot != null
                                                ? (documentSnapshot['kerja'])
                                                : ''),
                                            overflow: TextOverflow.clip,
                                            style: GoogleFonts.poppins(
                                                textStyle: style2),
                                            textAlign: TextAlign.center,
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                80, 0, 80, 0),
                                            padding: const EdgeInsets.all(10),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.green[700],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    (documentSnapshot != null
                                                        ? (documentSnapshot[
                                                            'rating'])
                                                        : ''),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                SizedBox(width: 10),
                                                Icon(Icons.star,
                                                    color: Colors.white)
                                              ],
                                            ),
                                          ),
                                          Text(
                                            (documentSnapshot != null
                                                ? (documentSnapshot['review']) +
                                                    " ulasan"
                                                : 'ulasan'),
                                            style: GoogleFonts.poppins(
                                                textStyle: style3),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.0,
                                      child: Column(
                                        children: [
                                          const Text(
                                            'Slot',
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                30, 0, 30, 0),
                                            padding: const EdgeInsets.all(10),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: const Color(0XFFFF8552),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  (documentSnapshot != null
                                                      ? (documentSnapshot[
                                                          'slot'])
                                                      : ''),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  width: 320,
                                  height: 215,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 320,
                                            height: 47,
                                            child: const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 180),
                                              child: VerticalDivider(
                                                thickness: 2,
                                                indent: 2,
                                                color: Colors.black,
                                              ),
                                            ),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                              ),
                                              color: Color.fromRGBO(
                                                  228, 228, 228, 1),
                                            ))),
                                    const Positioned(
                                        top: 16,
                                        left: 100,
                                        child: Text(
                                          'Review CV & Portofolio',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(34, 34, 34, 1),
                                              fontFamily: 'Times New Roman',
                                              fontSize: 14,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                    const Positioned(
                                      top: 6,
                                      left: 63,
                                      child: Divider(
                                          color:
                                              Color.fromRGBO(33, 160, 201, 1),
                                          thickness: 1),
                                    ),
                                    Positioned(
                                        top: 18,
                                        left: 27,
                                        child: Container(
                                            width: 14,
                                            height: 14,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    33, 160, 201, 1),
                                                width: 1.2000000476837158,
                                              ),
                                              borderRadius: const BorderRadius
                                                      .all(
                                                  Radius.elliptical(14, 14)),
                                            ))),
                                    Positioned(
                                        top: 21,
                                        left: 30,
                                        child: Container(
                                            width: 8,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              color: Color.fromRGBO(
                                                  32, 160, 200, 1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(8, 8)),
                                            ))),
                                    Positioned(
                                        top: 59,
                                        left: 0,
                                        child: Container(
                                            width: 320,
                                            height: 47,
                                            child: const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 180),
                                              child: VerticalDivider(
                                                thickness: 2,
                                                indent: 2,
                                                color: Colors.black,
                                              ),
                                            ),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                              ),
                                              color: Color.fromRGBO(
                                                  228, 228, 228, 1),
                                            ))),
                                    const Positioned(
                                        top: 75,
                                        left: 100,
                                        child: Text(
                                          'Pemberian materi dan tugas',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(34, 34, 34, 1),
                                              fontFamily: 'Times New Roman',
                                              fontSize: 14,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                    const Positioned(
                                      top: 65,
                                      left: 63,
                                      child: Divider(
                                          color:
                                              Color.fromRGBO(33, 160, 201, 1),
                                          thickness: 1),
                                    ),
                                    Positioned(
                                        top: 77,
                                        left: 27,
                                        child: Container(
                                            width: 14,
                                            height: 14,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    33, 160, 201, 1),
                                                width: 1.2000000476837158,
                                              ),
                                              borderRadius: const BorderRadius
                                                      .all(
                                                  Radius.elliptical(14, 14)),
                                            ))),
                                    Positioned(
                                        top: 80,
                                        left: 30,
                                        child: Container(
                                            width: 8,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              color: Color.fromRGBO(
                                                  33, 160, 201, 1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(8, 8)),
                                            ))),
                                    Positioned(
                                        top: 168,
                                        left: 0,
                                        child: Container(
                                            width: 320,
                                            height: 47,
                                            child: const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 180),
                                              child: VerticalDivider(
                                                thickness: 2,
                                                indent: 2,
                                                color: Colors.black,
                                              ),
                                            ),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                              ),
                                              color: Color.fromRGBO(
                                                  228, 228, 228, 1),
                                            ))),
                                    const Positioned(
                                      top: 174,
                                      left: 63,
                                      child: Divider(
                                          color:
                                              Color.fromRGBO(33, 160, 201, 1),
                                          thickness: 1),
                                    ),
                                    Positioned(
                                        top: 186,
                                        left: 27,
                                        child: Container(
                                            width: 14,
                                            height: 14,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    33, 160, 201, 1),
                                                width: 1.2000000476837158,
                                              ),
                                              borderRadius: const BorderRadius
                                                      .all(
                                                  Radius.elliptical(14, 14)),
                                            ))),
                                    Positioned(
                                        top: 189,
                                        left: 30,
                                        child: Container(
                                            width: 8,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              color: Color.fromRGBO(
                                                  33, 160, 201, 1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(8, 8)),
                                            ))),
                                    Positioned(
                                        top: 114,
                                        left: 0,
                                        child: Container(
                                            width: 320,
                                            height: 47,
                                            child: const Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 180),
                                              child: VerticalDivider(
                                                thickness: 2,
                                                indent: 2,
                                                color: Colors.black,
                                              ),
                                            ),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                              ),
                                              color: Color.fromRGBO(
                                                  228, 228, 228, 1),
                                            ))),
                                    const Positioned(
                                        top: 130,
                                        left: 100,
                                        child: Text(
                                          'Interview',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(34, 34, 34, 1),
                                              fontFamily: 'Times New Roman',
                                              fontSize: 14,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                    const Positioned(
                                        top: 183,
                                        left: 100,
                                        child: Text(
                                          'Video Pembelajaran',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(34, 34, 34, 1),
                                              fontFamily: 'Times New Roman',
                                              fontSize: 14,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                    const Positioned(
                                      top: 120,
                                      left: 63,
                                      child: Divider(
                                          color:
                                              Color.fromRGBO(33, 160, 201, 1),
                                          thickness: 1),
                                    ),
                                    Positioned(
                                        top: 132,
                                        left: 27,
                                        child: Container(
                                            width: 14,
                                            height: 14,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    33, 160, 201, 1),
                                                width: 1.2000000476837158,
                                              ),
                                              borderRadius: const BorderRadius
                                                      .all(
                                                  Radius.elliptical(14, 14)),
                                            ))),
                                    Positioned(
                                        top: 135,
                                        left: 30,
                                        child: Container(
                                            width: 8,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              color: Color.fromRGBO(
                                                  33, 160, 201, 1),
                                              borderRadius: BorderRadius.all(
                                                  const Radius.elliptical(
                                                      8, 8)),
                                            ))),
                                  ])),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  updateData();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Payment(
                                              selectedMentor: selectedMentor)));
                                },
                                child: Text(
                                  'Jadikan mentor saya',
                                  style: GoogleFonts.poppins(textStyle: style),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
          );
        });
  }

  updateData() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    UserModel userModel = UserModel(saldo: 0);
    userModel.id_mentor = documentId;
    await firebaseFirestore
        .collection('users')
        .doc(user!.uid)
        .update({'id_mentor': documentId});
  }
}
