import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorskill/page/class_menu3.dart';

class ClassMenu2 extends StatelessWidget {
  ClassMenu2({Key? key}) : super(key: key);

  TextStyle style = TextStyle(fontSize: 20);
  TextStyle style2 = TextStyle(fontSize: 18);
  TextStyle style3 = TextStyle(fontSize: 15);

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
                      '2. Pengembangan android dengan kotlin',
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
                '- Membangun User Interface yang interaktif dan responsif',
                style: GoogleFonts.poppins(textStyle: style2),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {},
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
                '- Membuat navigasi aplikasi',
                style: GoogleFonts.poppins(textStyle: style2),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {},
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
                '- Mengelola Database',
                style: GoogleFonts.poppins(textStyle: style2),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {},
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
                '- Video Pembelajaran',
                style: GoogleFonts.poppins(textStyle: style2),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {},
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClassMenu3()));
                    },
                    icon: Icon(
                      Icons.arrow_forward_rounded,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
