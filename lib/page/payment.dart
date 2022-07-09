import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorskill/controller/bottom_navi.dart';
import 'package:mentorskill/page/paymentControl.dart';

class Payment extends StatelessWidget {
  Payment({Key? key, required this.selectPayment, required this.selectedMentor})
      : super(key: key);
  //style
  TextStyle style = TextStyle(fontSize: 20, color: Colors.white);
  TextStyle style2 = TextStyle(fontSize: 45, fontWeight: FontWeight.bold);
  TextStyle style3 = TextStyle(fontSize: 20);
  //variable
  final String selectPayment;
  final int selectedMentor;

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('mentor')
                .where('id_major', isEqualTo: selectPayment)
                .snapshots(),
            builder: (context, snapshot) {
              QueryDocumentSnapshot? documentSnapshot =
                  snapshot.data?.docs[selectedMentor];
              if (snapshot.hasError) {
                return Text('Something went wrong');
              } else if (snapshot.hasData || snapshot.data != null) {
                return SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Pembayaran',
                          style: GoogleFonts.poppins(textStyle: style2),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Paket Skill 1',
                              style: GoogleFonts.poppins(textStyle: style3),
                            ),
                            Text(
                              (documentSnapshot != null
                                  ? (documentSnapshot['harga'])
                                  : ''),
                              style: GoogleFonts.poppins(textStyle: style3),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Pembayaran',
                              style: GoogleFonts.poppins(textStyle: style3),
                            ),
                            Text(
                              (documentSnapshot != null
                                  ? (documentSnapshot['harga'])
                                  : ''),
                              style: GoogleFonts.poppins(textStyle: style3),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentControl()));
                          },
                          child: Text(
                            'Bayar',
                            style: GoogleFonts.poppins(textStyle: style),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                ),
              );
            }),
      ),
    );
  }
}
