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
  TextStyle style = TextStyle(fontSize: 20, color: Colors.white);
  TextStyle style2 = TextStyle(fontSize: 45, fontWeight: FontWeight.bold);
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
  UserModel loggedInUser = UserModel();

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
                      padding: EdgeInsets.fromLTRB(140, 10, 140, 10),
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
            return "Masukkan Password";
          } else if (value != newPasswordController.text) {
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
    User? user = await FirebaseAuth.instance.currentUser!;
    String email = user.email!;

    //Create field for user to input old password

    //pass the password here
    String password = oldPasswordController.text;
    String newPassword = newPasswordController.text;

    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        user.updatePassword(newPassword).then((_) async {
          var snackBar = SnackBar(
            content: Text('Berhasil Mengganti Password'),
            duration: Duration(milliseconds: 700),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          await _auth.signOut();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Login()),
              (route) => false);
        }).catchError((error) {
          // + error.toString()
          var errorSnackBar = SnackBar(
            content: Text('Password Tidak Bisa Diganti'),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          var eSnackBar = SnackBar(
            content: Text('Tidak ada user yang ditemukan untuk email itu'),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(eSnackBar);
        } else if (e.code == 'wrong-password') {
          var errSnackBar = SnackBar(
            content: Text('Kata sandi salah untuk user tersebut.'),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(errSnackBar);
        }
      }
    }
  }
}