import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorskill/controller/bottom_navi.dart';

class ClassMenu3 extends StatefulWidget {
  ClassMenu3({Key? key}) : super(key: key);

  @override
  State<ClassMenu3> createState() => _ClassMenu3State();
}

class _ClassMenu3State extends State<ClassMenu3> {
  //style
  TextStyle style = TextStyle(fontSize: 20);
  TextStyle style2 = TextStyle(fontSize: 22);
  //controller
  TextFormField urlController = TextFormField();

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
        floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => BottomNavi()),
                          (route) => false);
                    },
                    child: Text(
                      'Kembali ke Beranda',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 20)),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
        body: Container(
          margin: EdgeInsets.fromLTRB(10, 55, 10, 0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 6,
                        child: Text(
                          '3. Final Project',
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Upload URL Projectmu yang telah anda ikuti dari awal sampai akhir',
                    style: GoogleFonts.poppins(textStyle: style2),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('Input URL Github'),
                                content: TextFormField(
                                  // controller: emailController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Masukkan URL";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      labelText: 'Input URL Github',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 3, color: Colors.blue),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 3, color: Colors.blue),
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {}, child: Text('Simpan'))
                                ],
                              ));
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.github,
                      color: Colors.black,
                      size: 50,
                    ),
                    label: Text(
                      'Upload URL',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 20)),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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
