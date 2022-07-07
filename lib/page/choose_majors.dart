import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseMajors extends StatefulWidget {
  const ChooseMajors({Key? key}) : super(key: key);

  @override
  State<ChooseMajors> createState() => _ChooseMajorsState();
}

class _ChooseMajorsState extends State<ChooseMajors> {
  //style
  TextStyle style = TextStyle(fontSize: 20, color: Colors.white);
  TextStyle style2 = TextStyle(fontSize: 45);
  //variabel
  final _formKey = GlobalKey<FormState>();
  String _majors = 'webDev';

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
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Halo Admin',
                    style: GoogleFonts.poppins(textStyle: style2),
                  ), // harus bisa get nama dari firebase
                  Text('Tentukan bidang apa yang kamu minati!'),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: Column(
                      children: [
                        Text('Pilih Opsi Anda'),
                        Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                        RadioListTile(
                            value: 'webDev',
                            groupValue: _majors,
                            title: Text('Website Developer'),
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                _majors = value.toString();
                              });
                            }),
                        RadioListTile(
                            value: 'androDev',
                            groupValue: _majors,
                            title: Text('Android Developer'),
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                _majors = value.toString();
                              });
                            }),
                        RadioListTile(
                            value: 'graphicDesign',
                            groupValue: _majors,
                            title: Text('Desain Grafis'),
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                _majors = value.toString();
                              });
                            }),
                        //skill tampil sesuai dengan apa yang dipilih
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Selanjutnya',
                      style: GoogleFonts.poppins(textStyle: style),
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
        ),
      ),
    );
  }
}
