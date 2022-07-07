import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorskill/model/user_model.dart';
import 'package:mentorskill/page/choose_mentor.dart';

class ChooseMajors extends StatefulWidget {
  const ChooseMajors({Key? key}) : super(key: key);

  @override
  State<ChooseMajors> createState() => _ChooseMajorsState();
}

class _ChooseMajorsState extends State<ChooseMajors> {
  //style
  TextStyle style = TextStyle(fontSize: 20, color: Colors.white);
  TextStyle style2 = TextStyle(fontSize: 45);
  TextStyle style3 = TextStyle(fontSize: 15);
  TextStyle style4 = TextStyle(fontSize: 17);
  //variabel
  final _formKey = GlobalKey<FormState>();
  String _majors = 'webDev';
  //option
  String skillDefault =
      'Skill 1 = Dapat membuat aplikasi front-end web yang responsif, memiliki aksesibilitas yang baik, mudah di-maintenance, memiliki sifat native, dapat diuji, dan memiliki performa yang baik.' +
          'Skill 2 = Diharapkan sudah mampu mengembangkan aplikasi web di sisi Front-End, menguasai HTML, CSS, dan JavaScript serta sudah familier dengan Webpack sebagai module bundler.' +
          'Skill 3 = Bisa belajar mandiri, berkomitmen, benar-benar punya rasa ingin tahu, dan tertarik pada subjek materi, karena sebaik apa pun materi kelas ini, tidak akan berguna tanpa keseriusan mahasiswa untuk belajar, berlatih, dan mencoba.';
  String skillWebDev =
      'Skill 1 = Dapat membuat aplikasi front-end web yang responsif, memiliki aksesibilitas yang baik, mudah di-maintenance, memiliki sifat native, dapat diuji, dan memiliki performa yang baik.' +
          'Skill 2 = Diharapkan sudah mampu mengembangkan aplikasi web di sisi Front-End, menguasai HTML, CSS, dan JavaScript serta sudah familier dengan Webpack sebagai module bundler.' +
          'Skill 3 = Bisa belajar mandiri, berkomitmen, benar-benar punya rasa ingin tahu, dan tertarik pada subjek materi, karena sebaik apa pun materi kelas ini, tidak akan berguna tanpa keseriusan mahasiswa untuk belajar, berlatih, dan mencoba.';
  String skillAndroDev =
      'Skill 1 = Android developer yang paham fundamental aplikasi Android mulai dari layout sampai background process dan juga penggunaan komponen VIewModel, LiveData, serta Room untuk membangun aplikasi dengan Android Architecture Component' +
          'Skill 2 =  Dapat membuat aplikasi yang scalable dan maintainable dengan menerapkan berbagai macam komponen yang sering digunakan di dunia industri.' +
          'Skill 3 = Bisa belajar mandiri, berkomitmen, benar-benar punya rasa ingin tahu, dan tertarik pada subjek materi, karena sebaik apa pun materi kelas ini, tidak akan berguna tanpa keseriusan mahasiswa untuk belajar, berlatih, dan mencoba. ';
  String skillGraphicDesign =
      'Skill 1 =  Harus menguasai prinsip-prinsip dalam desain seperti hierarchy, contrast, repetition, alignment, balance, dan lain-lain. Semua prinsip desain ini harus kamu kuasai dan gunakan untuk membuat desain yang menarik secara visual dan terstruktur dengan baik.' +
          'Skill 2 = Kemampuan komunikasi yang baik agar dapat sukses. Pasalnya, kamu perlu bekerja dengan berbagai klien dan tim dengan berbagai latar belakang pendidikan.' +
          'Skill 3 = Bisa belajar mandiri, berkomitmen, benar-benar punya rasa ingin tahu, dan tertarik pada subjek materi, karena sebaik apa pun materi kelas ini, tidak akan berguna tanpa keseriusan mahasiswa untuk belajar, berlatih, dan mencoba. ';
  //firebase
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Halo ${loggedInUser.nama}',
                      style: GoogleFonts.poppins(textStyle: style2),
                    ),
                  ), // harus bisa get nama dari firebase
                  Text('Tentukan bidang apa yang kamu minati!',
                      style: GoogleFonts.poppins(textStyle: style4)),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Pilih Opsi Anda',
                            style: GoogleFonts.poppins(
                                textStyle: style4, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                        RadioListTile(
                            value: 'webDev',
                            groupValue: _majors,
                            title: Text('Website Developer',
                                style: GoogleFonts.poppins(textStyle: style3)),
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                _majors = value.toString();
                                skillDefault = skillWebDev;
                                // value = webDev;
                                // webDev = skillnya, majors = valuenya
                              });
                            }),
                        RadioListTile(
                            value: 'androDev',
                            groupValue: _majors,
                            title: Text('Android Developer',
                                style: GoogleFonts.poppins(textStyle: style3)),
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                _majors = value.toString();
                                // value = androDev;
                                skillDefault = skillAndroDev;
                              });
                            }),
                        RadioListTile(
                            value: 'graphicDesign',
                            groupValue: _majors,
                            title: Text('Desain Grafis',
                                style: GoogleFonts.poppins(textStyle: style3)),
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                _majors = value.toString();
                                // value = graphicDesign;
                                skillDefault = skillGraphicDesign;
                              });
                            }),
                      ],
                    ),
                  ),
                  Text(skillDefault,
                      style: GoogleFonts.poppins(textStyle: style3)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseMentor()));
                    },
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
