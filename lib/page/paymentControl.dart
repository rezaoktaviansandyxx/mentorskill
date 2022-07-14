import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentControl extends StatefulWidget {
  const PaymentControl({Key? key}) : super(key: key);

  @override
  State<PaymentControl> createState() => _PaymentControlState();
}

class _PaymentControlState extends State<PaymentControl> {
  //controller
  TextEditingController nominalController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //style
  TextStyle style = TextStyle(fontSize: 20, color: Colors.white);
  TextStyle style2 = TextStyle(fontSize: 15, color: Colors.black);
  //firebase
  final _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Saldo anda tidak mencukupi\n' +
                          'Anda harus mengisi saldo tersebut',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 20)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Masukkan jumlah nominal yang ingin diisi',
                        style: GoogleFonts.poppins(textStyle: style2)),
                    SizedBox(
                      height: 15,
                    ),
                    nominalText(),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    addNominal();
                  },
                  child: Text(
                    'Isi Saldo',
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
    );
  }

  TextFormField nominalText() => TextFormField(
        controller: nominalController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Nominal',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            )),
      );

  addNominal() async {
    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;
      await firebaseFirestore.collection('users').doc(user!.uid).update({
        'saldo':
            FieldValue.increment(int.parse(nominalController.text.toString()))
      });
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Pengisian saldo Berhasil'),
                content: Text(
                    'Pengisian saldo anda sebesar ${nominalController.text} telah berhasil ditambahkan'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text('OK'))
                ],
              ));
      // var snackBar = SnackBar(
      //   duration: Duration(milliseconds: 1500),
      //   content: Text('Pengisian saldo ${nominalController.text} berhasil'),
      //   backgroundColor: Colors.green,
      // );
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Navigator.pop(context);
    } catch (e) {
      var snackBar = SnackBar(
        duration: Duration(milliseconds: 1500),
        content:
            Text('Pengisian saldo ${nominalController.text} tidak berhasil'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
