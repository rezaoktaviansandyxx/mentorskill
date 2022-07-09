import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorskill/controller/login.dart';
import 'package:mentorskill/model/user_model.dart';
import 'package:mentorskill/page/change_password.dart';
import 'package:mentorskill/page/edit_profile.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  //style
  TextStyle style = TextStyle(fontSize: 45, fontWeight: FontWeight.bold);
  TextStyle style2 = TextStyle(fontSize: 25);
  TextStyle style3 = TextStyle(fontSize: 35);
  TextStyle style4 = TextStyle(fontSize: 15);
  //controller
  final _formKey = GlobalKey<FormState>();
  //variabel
//firebase
  final _auth = FirebaseAuth.instance;
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Akun Saya',
                        style: GoogleFonts.poppins(textStyle: style),
                      ),
                      IconButton(
                          onPressed: () {
                            signOut();
                          },
                          icon: Icon(
                            Icons.exit_to_app,
                            size: 38,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Selamat Datang',
                              style: GoogleFonts.poppins(textStyle: style2),
                            ),
                            Text(
                              '${loggedInUser.nama}',
                              style: GoogleFonts.poppins(textStyle: style3),
                            ),
                            Text(
                              '${loggedInUser.email}',
                              style: GoogleFonts.poppins(textStyle: style2),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.account_circle_rounded,
                        size: 60,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Data Pribadi',
                        style: GoogleFonts.poppins(textStyle: style2),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile()));
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 30,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Email',
                        style: GoogleFonts.poppins(textStyle: style4),
                      ),
                      Text(
                        '${loggedInUser.email}',
                        style: GoogleFonts.poppins(textStyle: style4),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nama Lengkap',
                        style: GoogleFonts.poppins(textStyle: style4),
                      ),
                      Text(
                        '${loggedInUser.nama}',
                        style: GoogleFonts.poppins(textStyle: style4),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jenis Kelamin',
                        style: GoogleFonts.poppins(textStyle: style4),
                      ),
                      Text(
                        '${loggedInUser.jkel}',
                        style: GoogleFonts.poppins(textStyle: style4),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tanggal Lahir',
                        style: GoogleFonts.poppins(textStyle: style4),
                      ),
                      Text(
                        '${loggedInUser.tglLahir}',
                        style: GoogleFonts.poppins(textStyle: style4),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Handphone',
                        style: GoogleFonts.poppins(textStyle: style4),
                      ),
                      Text(
                        '${loggedInUser.phone}',
                        style: GoogleFonts.poppins(textStyle: style4),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sertifikat',
                        style: GoogleFonts.poppins(textStyle: style4),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_rounded,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ganti Kata Sandi',
                        style: GoogleFonts.poppins(textStyle: style4),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangePassword()));
                        },
                        icon: Icon(
                          Icons.arrow_forward_rounded,
                          size: 40,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signOut() async {
    try {
      await _auth.signOut();
      var snackBar = SnackBar(
        content: Text('Berhasil Keluar'),
        duration: Duration(milliseconds: 700),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Login()), (route) => false);
    } catch (e) {
      var errorSnackBar = SnackBar(
        content: Text('Tidak Keluar'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
    }
  }
}
