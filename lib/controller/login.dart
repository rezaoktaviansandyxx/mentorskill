import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorskill/controller/bottom_navi.dart';
import 'package:mentorskill/controller/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //style
  TextStyle style = const TextStyle(fontSize: 45, fontWeight: FontWeight.bold);
  TextStyle style2 = const TextStyle(fontSize: 20);
  TextStyle style3 = const TextStyle(fontSize: 20, color: Colors.white);

  //firebase
  final _auth = FirebaseAuth.instance;

  //controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //variabel
  bool isHiddenPassword = true;

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

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
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(textStyle: style),
                    ),
                  ),
                  emailText(),
                  passwordText(),
                  ElevatedButton(
                    onPressed: () {
                      signIn(emailController.text, passController.text);
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(textStyle: style3),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Text(
                    'Daftar Sekarang',
                    style: GoogleFonts.poppins(textStyle: style2),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Register()));
                    },
                    child: Text(
                      'Daftar',
                      style: GoogleFonts.poppins(textStyle: style3),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
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

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) {
        var snackbar = const SnackBar(
          content: Text('Anda berhasil masuk'),
          duration: Duration(milliseconds: 700),
          backgroundColor: Colors.green,
        );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const BottomNavi()));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }).catchError((e) {
        var errorSnackbar = const SnackBar(
          content: Text("Email/kata sandi salah"),
          duration: Duration(milliseconds: 700),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(errorSnackbar);
      });
    }
  }

  TextFormField passwordText() => TextFormField(
        controller: passController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Masukkan Kata Sandi";
          } else {
            return null;
          }
        },
        obscureText: isHiddenPassword,
        decoration: InputDecoration(
          labelText: 'Kata Sandi',
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
}
