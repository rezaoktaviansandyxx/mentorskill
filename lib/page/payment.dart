import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorskill/controller/bottom_navi.dart';
import 'package:mentorskill/model/user_model.dart';
import 'package:mentorskill/page/paymentControl.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key, this.selectPayment, required this.selectedMentor})
      : super(key: key);
  final String? selectPayment;
  final int selectedMentor;

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  //style
  TextStyle style = TextStyle(fontSize: 20, color: Colors.white);

  TextStyle style2 = TextStyle(fontSize: 45, fontWeight: FontWeight.bold);

  TextStyle style3 = TextStyle(fontSize: 20);

  //firebase
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel(saldo: 0);

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {
        // var saldo = "${loggedInUser.saldo}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final stream1 = FirebaseFirestore.instance
    //     .collection('mentor')
    //     .where('id_major', isEqualTo: selectPayment)
    //     .snapshots();

    // final stream2 = FirebaseFirestore.instance.collection('users').snapshots();
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
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('mentor')
                .where('id_major', isEqualTo: widget.selectPayment)
                .snapshots(),
            // stream: getData(),
            // stream: CombineLatestStream.list([stream1, stream2]),
            builder: (context, snapshot) {
              QueryDocumentSnapshot? documentSnapshot =
                  snapshot.data?.docs[widget.selectedMentor];

              // final dataMentor = snapshot.data?.docs[selectedMentor];
              // try {
              //   dynamic nested = documentSnapshot!.get('saldo');
              // } on StateError catch (e) {
              //   print(e);
              // }
              // print();
              if (snapshot.hasError) {
                return Text('Something went wrong');
              } else if (snapshot.hasData || snapshot.data != null) {
                return Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Pembayaran',
                        style: GoogleFonts.poppins(textStyle: style2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Paket Skill 1',
                            style: GoogleFonts.poppins(textStyle: style3),
                          ),
                          Text(
                            (documentSnapshot != null
                                ? (documentSnapshot['harga'])
                                : ''),
                            style: GoogleFonts.poppins(textStyle: style3),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Saldo anda',
                                style: GoogleFonts.poppins(textStyle: style3),
                              ),
                              Text(
                                // documentSnapshot!.data().toString().contains('')
                                //     ? documentSnapshot.get('')
                                //     : "0",
                                "${loggedInUser.saldo}",
                                style: GoogleFonts.poppins(textStyle: style3),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Pembayaran',
                                style: GoogleFonts.poppins(textStyle: style3),
                              ),
                              Text(
                                (documentSnapshot != null
                                    ? (documentSnapshot['harga'])
                                    : ''),
                                style: GoogleFonts.poppins(textStyle: style3),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentControl(
                                        selectedMentor: widget.selectedMentor)),
                              ).then((value) => setState(() {}));
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
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (int.parse('${loggedInUser.saldo}') <=
                                  int.parse(documentSnapshot!['harga'])) {
                                // var snackBar = SnackBar(
                                //   duration: Duration(milliseconds: 1500),
                                //   content: Text(
                                //       'Saldo anda tidak cukup'),
                                //   backgroundColor: Colors.red,
                                // );
                                // ScaffoldMessenger.of(context)
                                //     .showSnackBar(snackBar);
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Pembayaran Ditolak'),
                                    content: const Text(
                                        'Maaf, saldo anda tidak cukup, silahkan isi uang saldo anda terlebih dahulu'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK')),
                                    ],
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Pembayaran Berhasil'),
                                    content: const Text(
                                        'Selamat, anda berhasil melakukan pembayaran, anda sekarang memiliki mentor'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(user!.uid)
                                                .update({
                                              'saldo': int.parse(
                                                      '${loggedInUser.saldo}')-int.parse(
                                                  documentSnapshot['harga'])
                                            });
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BottomNavi()),
                                                (route) => false);
                                          },
                                          child: const Text('OK')),
                                    ],
                                  ),
                                );
                              }
                            },
                            child: Text(
                              'Bayar',
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
                      // ElevatedButton(
                      //   onPressed: () {
                      //     showDialog(
                      //       context: context,
                      //       builder: (context) => AlertDialog(
                      //         title: Text(
                      //             'Masukkan jumlah nominal yang ingin diisi',
                      //             style: GoogleFonts.poppins(
                      //                 textStyle: TextStyle(
                      //                     fontSize: 15,
                      //                     color: Colors.black))),
                      //         content: TextFormField(
                      //           controller: nominalController,
                      //           keyboardType: TextInputType.number,
                      //           decoration: InputDecoration(
                      //               labelText: 'Nominal',
                      //               enabledBorder: OutlineInputBorder(
                      //                 borderSide: const BorderSide(
                      //                     width: 3, color: Colors.blue),
                      //                 borderRadius: BorderRadius.circular(15),
                      //               ),
                      //               focusedBorder: OutlineInputBorder(
                      //                 borderSide: const BorderSide(
                      //                     width: 3, color: Colors.blue),
                      //                 borderRadius: BorderRadius.circular(15),
                      //               )),
                      //         ),
                      //         actions: [
                      //           TextButton(
                      //               onPressed: () {
                      //                 Navigator.pop(context);
                      //               },
                      //               child: Text('Batal')),
                      //           TextButton(
                      //               onPressed: () async {
                      //                 // addNominal();
                      //                 try {
                      //                   FirebaseFirestore firebaseFirestore =
                      //                       FirebaseFirestore.instance;
                      //                   User? user = _auth.currentUser;
                      //                   await firebaseFirestore
                      //                       .collection('users')
                      //                       .doc(user!.uid)
                      //                       .update({
                      //                     'saldo': int.parse(nominalController
                      //                         .text
                      //                         .toString())
                      //                   });
                      //                   var snackBar = SnackBar(
                      //                     duration:
                      //                         Duration(milliseconds: 1000),
                      //                     content: Text(
                      //                         'Pengisian saldo ${nominalController.text} berhasil'),
                      //                     backgroundColor: Colors.green,
                      //                   );
                      //                   ScaffoldMessenger.of(context)
                      //                       .showSnackBar(snackBar);
                      //                   await Navigator.push(
                      //                       context,
                      //                       MaterialPageRoute(
                      //                           builder: (context) =>
                      //                               BottomNavi()));
                      //                 } catch (e) {
                      //                   var snackBar = SnackBar(
                      //                     duration:
                      //                         Duration(milliseconds: 1000),
                      //                     content: Text(
                      //                         'Pengisian saldo ${nominalController.text} tidak berhasil'),
                      //                     backgroundColor: Colors.red,
                      //                   );
                      //                   ScaffoldMessenger.of(context)
                      //                       .showSnackBar(snackBar);
                      //                 }
                      //               },
                      //               child: Text('OK')),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      //   child: Text(
                      //     'Bayar',
                      //     style: GoogleFonts.poppins(textStyle: style),
                      //   ),
                      //   style: ElevatedButton.styleFrom(
                      //     primary: Colors.orange,
                      //     padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                ),
              );
            }),
      ),
    );
  }
}
