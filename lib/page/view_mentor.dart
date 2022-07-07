import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewMentor extends StatelessWidget {
  ViewMentor({Key? key}) : super(key: key);
  //Style
  final style1 = TextStyle(fontSize: 20);
  final style2 = TextStyle(fontSize: 20, color: Colors.blue);
  final style3 = TextStyle(fontSize: 16, color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/mentor2.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.green, spreadRadius: 3),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Bapusaheb P.',
                            style: GoogleFonts.poppins(textStyle: style1),
                          ),
                          Text(
                            'Mobile Enginner @ Softway',
                            style: GoogleFonts.poppins(textStyle: style2),
                          ),
                          Container(
                            width: 70,
                            height: 40,
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green[700],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('4',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(width: 10),
                                Icon(Icons.star, color: Colors.white)
                              ],
                            ),
                          ),
                          Text(
                            '180 ulasan',
                            style: GoogleFonts.poppins(textStyle: style3),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Slot',
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            width: 70,
                            height: 40,
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0XFFFF8552),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '3/5',
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
                                child: Padding(
                                  padding: EdgeInsets.only(right: 180),
                                  child: VerticalDivider(
                                    thickness: 2,
                                    indent: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: Color.fromRGBO(228, 228, 228, 1),
                                ))),
                        Positioned(
                            top: 16,
                            left: 100,
                            child: Text(
                              'Review CV & Portofolio',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(34, 34, 34, 1),
                                  fontFamily: 'Times New Roman',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                          top: 6,
                          left: 63,
                          child: Divider(
                              color: Color.fromRGBO(33, 160, 201, 1),
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
                                    color: Color.fromRGBO(33, 160, 201, 1),
                                    width: 1.2000000476837158,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(14, 14)),
                                ))),
                        Positioned(
                            top: 21,
                            left: 30,
                            child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(32, 160, 200, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.elliptical(8, 8)),
                                ))),
                        Positioned(
                            top: 59,
                            left: 0,
                            child: Container(
                                width: 320,
                                height: 47,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 180),
                                  child: VerticalDivider(
                                    thickness: 2,
                                    indent: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: Color.fromRGBO(228, 228, 228, 1),
                                ))),
                        Positioned(
                            top: 75,
                            left: 100,
                            child: Text(
                              'Pemberian materi dan tugas',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(34, 34, 34, 1),
                                  fontFamily: 'Times New Roman',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                          top: 65,
                          left: 63,
                          child: Divider(
                              color: Color.fromRGBO(33, 160, 201, 1),
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
                                    color: Color.fromRGBO(33, 160, 201, 1),
                                    width: 1.2000000476837158,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(14, 14)),
                                ))),
                        Positioned(
                            top: 80,
                            left: 30,
                            child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(33, 160, 201, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.elliptical(8, 8)),
                                ))),
                        Positioned(
                            top: 168,
                            left: 0,
                            child: Container(
                                width: 320,
                                height: 47,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 180),
                                  child: VerticalDivider(
                                    thickness: 2,
                                    indent: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: Color.fromRGBO(228, 228, 228, 1),
                                ))),
                        Positioned(
                          top: 174,
                          left: 63,
                          child: Divider(
                              color: Color.fromRGBO(33, 160, 201, 1),
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
                                    color: Color.fromRGBO(33, 160, 201, 1),
                                    width: 1.2000000476837158,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(14, 14)),
                                ))),
                        Positioned(
                            top: 189,
                            left: 30,
                            child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(33, 160, 201, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.elliptical(8, 8)),
                                ))),
                        Positioned(
                            top: 114,
                            left: 0,
                            child: Container(
                                width: 320,
                                height: 47,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 180),
                                  child: VerticalDivider(
                                    thickness: 2,
                                    indent: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: Color.fromRGBO(228, 228, 228, 1),
                                ))),
                        Positioned(
                            top: 130,
                            left: 100,
                            child: Text(
                              'Interview',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(34, 34, 34, 1),
                                  fontFamily: 'Times New Roman',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                            top: 183,
                            left: 100,
                            child: Text(
                              'Video Pembelajaran',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(34, 34, 34, 1),
                                  fontFamily: 'Times New Roman',
                                  fontSize: 14,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                        Positioned(
                          top: 120,
                          left: 63,
                          child: Divider(
                              color: Color.fromRGBO(33, 160, 201, 1),
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
                                    color: Color.fromRGBO(33, 160, 201, 1),
                                    width: 1.2000000476837158,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(14, 14)),
                                ))),
                        Positioned(
                            top: 135,
                            left: 30,
                            child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(33, 160, 201, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.elliptical(8, 8)),
                                ))),
                      ]))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
