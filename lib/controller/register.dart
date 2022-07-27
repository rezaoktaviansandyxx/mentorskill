import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorskill/controller/login.dart';
import 'package:mentorskill/model/user_model.dart';
import 'package:mentorskill/page/choose_majors.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //style
  TextStyle style = TextStyle(fontSize: 20, color: Colors.white);
  TextStyle style2 = TextStyle(fontSize: 20);
  TextStyle style3 = TextStyle(fontSize: 45, fontWeight: FontWeight.bold);
  //controller
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cPassController = TextEditingController();
  //variabel
  final _formKey = GlobalKey<FormState>();
  bool isHiddenPassword = true;
  final _auth = FirebaseAuth.instance;

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
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
                        'Daftar Akun',
                        style: GoogleFonts.poppins(textStyle: style3),
                      )),
                  nameText(),
                  emailText(),
                  passwordText(),
                  cPasswordText(),
                  ElevatedButton(
                    onPressed: () {
                      signUp(emailController.text, passController.text);
                    },
                    child: Text(
                      'Daftar',
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
                  Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Text(
                    'Sudah Punya Akun?',
                    style: GoogleFonts.poppins(textStyle: style2),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                          (route) => false);
                    },
                    child: Text(
                      'Login',
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
          ),
        ),
      ),
    );
  }

  TextFormField nameText() => TextFormField(
        controller: nameController,
        decoration: InputDecoration(
            labelText: 'Nama Lengkap',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            )),
      );
  TextFormField emailText() => TextFormField(
        controller: emailController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Masukkan Email";
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: 'Email',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            )),
      );
  TextFormField passwordText() => TextFormField(
        controller: passController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Masukkan Password";
          } else {
            return null;
          }
        },
        obscureText: isHiddenPassword,
        decoration: InputDecoration(
          labelText: 'Password',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.blue),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.blue),
            borderRadius: BorderRadius.circular(15),
          ),
          suffix: GestureDetector(
            onTap: _togglePasswordView,
            child: Icon(
                isHiddenPassword ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      );

  TextFormField cPasswordText() => TextFormField(
        controller: cPassController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Masukkan Konfirmasi Password";
          } else if (value != passController.text) {
            return 'Tidak Sama';
          }
          return null;
        },
        obscureText: isHiddenPassword,
        decoration: InputDecoration(
          labelText: 'Konfirmasi Password',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.blue),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.blue),
            borderRadius: BorderRadius.circular(15),
          ),
          suffix: GestureDetector(
            onTap: _togglePasswordView,
            child: Icon(
                isHiddenPassword ? Icons.visibility : Icons.visibility_off),
          ),
        ),
      );

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        postDetailsToFirestore();
      }).catchError((e) {
        var errorSnackbar = SnackBar(
          content: Text('Akun Sudah Digunakan'),
          duration: Duration(milliseconds: 700),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(errorSnackbar);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling our firestore
    //calling our user model
    //sending these value
    final firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel(saldo: 0);

    //writing all the value
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.nama = nameController.text;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());
    var snackBar = SnackBar(
      content: Text('Akun Berhasil dibuat'),
      duration: Duration(milliseconds: 700),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => ChooseMajors()), (route) => false);
  }
}
