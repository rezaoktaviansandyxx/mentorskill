import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorskill/controller/login.dart';
import 'package:mentorskill/model/user_model.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  //style
  TextStyle style = const TextStyle(fontSize: 20, color: Colors.white);
  TextStyle style2 = const TextStyle(fontSize: 45, fontWeight: FontWeight.bold);
  //variabel
  bool isHiddenPassword = true;
  //controller
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //firebase
  final _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel(saldo: 0);

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    repeatPasswordController.dispose();
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
                  Text(
                    'Ganti Kata Sandi',
                    style: GoogleFonts.poppins(textStyle: style2),
                  ),
                  oldPasswordText(),
                  newPasswordText(),
                  confirmNewPasswordText(),
                  ElevatedButton(
                    onPressed: () {
                      _changePassword(newPasswordController.text);
                    },
                    child: Text(
                      'Simpan',
                      style: GoogleFonts.poppins(textStyle: style),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      padding: const EdgeInsets.fromLTRB(140, 10, 140, 10),
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

  TextFormField confirmNewPasswordText() => TextFormField(
        controller: repeatPasswordController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Masukkan Konfirmasi Kata Sandi Baru";
          } else if (value != newPasswordController.text) {
            return 'Tidak Sama';
          }
          return null;
        },
        obscureText: isHiddenPassword,
        decoration: InputDecoration(
          labelText: 'Konfirmasi Kata Sandi Baru',
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

  TextFormField newPasswordText() => TextFormField(
        controller: newPasswordController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Masukkan Kata Sandi Baru";
          } else {
            return null;
          }
        },
        obscureText: isHiddenPassword,
        decoration: InputDecoration(
          labelText: 'Kata Sandi Baru',
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

  TextFormField oldPasswordText() => TextFormField(
        controller: oldPasswordController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Masukkan Kata Sandi Lama";
          } else {
            return null;
          }
        },
        obscureText: isHiddenPassword,
        decoration: InputDecoration(
          labelText: 'Kata Sandi Lama',
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

  void _changePassword(String password) async {
    User? user = FirebaseAuth.instance.currentUser!;
    String email = user.email!;

    //Create field for user to input old password

    //pass the password here
    String password = oldPasswordController.text;
    String newPassword = newPasswordController.text;

    if (_formKey.currentState!.validate()) {
      try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        user.updatePassword(newPassword).then((_) async {
          var snackBar = const SnackBar(
            content: Text('Berhasil Mengganti Kata Sandi'),
            duration: Duration(milliseconds: 700),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          await _auth.signOut();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
              (route) => false);
        }).catchError((error) {
          // + error.toString()
          var errorSnackBar = const SnackBar(
            content: Text('Password Tidak Bisa Diganti'),
            duration: Duration(milliseconds: 700),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          var eSnackBar = const SnackBar(
            content: Text('User tidak ditemukan'),
            duration: Duration(milliseconds: 700),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(eSnackBar);
        } else if (e.code == 'wrong-password') {
          var errSnackBar = const SnackBar(
            content: Text('Kata sandi lama salah'),
            duration: Duration(milliseconds: 700),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(errSnackBar);
        }
      }
    }
  }
}
