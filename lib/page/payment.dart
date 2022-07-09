import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorskill/controller/bottom_navi.dart';

class Payment extends StatelessWidget {
  Payment({Key? key}) : super(key: key);

  TextStyle style = TextStyle(fontSize: 20, color: Colors.white);
  TextStyle style2 = TextStyle(fontSize: 45, fontWeight: FontWeight.bold);
  TextStyle style3 = TextStyle(fontSize: 20);

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
        floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => BottomNavi()),
                (route) => false);
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
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
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
                      'Rp. 120.000',
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
                      'Rp. 120.000',
                      style: GoogleFonts.poppins(textStyle: style3),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
