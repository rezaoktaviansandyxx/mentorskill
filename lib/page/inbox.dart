import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Inbox extends StatelessWidget {
  Inbox({Key? key}) : super(key: key);
  //Style
  TextStyle style = TextStyle(fontSize: 45, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Kotak Masuk',
                    style: GoogleFonts.poppins(textStyle: style),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
