import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Certificate extends StatelessWidget {
  Certificate({ Key? key }) : super(key: key);
  //style
  TextStyle style = TextStyle(fontSize: 45, fontWeight: FontWeight.bold);
  TextStyle style2 = TextStyle(fontSize: 20, color: Colors.white);

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sertifikat',
                  style: GoogleFonts.poppins(textStyle: style),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/sertifikat.png',
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 200,
              ),
              ElevatedButton(
                onPressed: () {
                  launchUrlString(
                      'https://drive.google.com/file/d/15y_U4zhOrF5bwxeIUtU7D9EYryKENnwI/view?usp=sharing');
                },
                child: Text(
                  'Download',
                  style: GoogleFonts.poppins(textStyle: style2),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
