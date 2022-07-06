import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //style
  TextStyle style = TextStyle(fontSize: 45, fontWeight: FontWeight.bold);
  TextStyle style2 = TextStyle(fontSize: 20);
  TextStyle style3 = TextStyle(fontSize: 20, color: Colors.white);

  //controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  //variabel
  final _formKey = GlobalKey<FormState>();
  bool isHiddenPassword = true;

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
                      'Login',
                      style: GoogleFonts.poppins(textStyle: style),
                    ),
                  ),
                  emailControlller(),
                  passwordController(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(textStyle: style3),
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
                    'Daftar Sekarang',
                    style: GoogleFonts.poppins(textStyle: style2),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Daftar',
                      style: GoogleFonts.poppins(textStyle: style3),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      padding: EdgeInsets.fromLTRB(145, 10, 145, 10),
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

  TextFormField passwordController() => TextFormField(
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

  TextFormField emailControlller() => TextFormField(
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
