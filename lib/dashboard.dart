import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorskill/model/user_model.dart';
import 'package:mentorskill/page/class_menu.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //style
  TextStyle style = TextStyle(fontSize: 20);
  TextStyle style2 = TextStyle(fontSize: 35);
  TextStyle style3 = TextStyle(fontSize: 18);
  //firebase
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel(saldo: 0);
  String contactMentor = "";

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
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('mentor')
              .where('id_mentor', isEqualTo: loggedInUser.id_mentor)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.active) {
              return const Center(child: CircularProgressIndicator());
            }
            QueryDocumentSnapshot? documentSnapshot = snapshot.data?.docs[0];
            contactMentor = (documentSnapshot?['no_hp']);
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          'assets/images/logomentor.png',
                          fit: BoxFit.contain,
                          width: 200,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            size: 100,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Selamat Datang',
                                  style: GoogleFonts.poppins(textStyle: style),
                                ),
                                Text(
                                  '${loggedInUser.nama}',
                                  style: GoogleFonts.poppins(
                                      textStyle: style2,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Flexible(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 75.0,
                                    backgroundImage: NetworkImage(
                                        (documentSnapshot?['foto'])),
                                  ),
                                  Text(
                                    documentSnapshot?['nama'],
                                    style:
                                        GoogleFonts.poppins(textStyle: style3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                'Chat dengan Mentor',
                                style: GoogleFonts.poppins(textStyle: style3),
                              ),
                              IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.whatsapp,
                                  color: Colors.green,
                                  size: 40,
                                ),
                                onPressed: () {
                                  whatsAppOpen();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ClassMenu()));
                        },
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.book),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              'Lihat kelas saya',
                              style: GoogleFonts.poppins(textStyle: style),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  void whatsAppOpen() async {
    var countryCode = '+62';
    var phone = countryCode + contactMentor;
    var whatsappUrl = "whatsapp://send?phone=$phone";
    await canLaunchUrlString(whatsappUrl)
        ? launchUrlString(whatsappUrl)
        : print(
            "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
  }
}
