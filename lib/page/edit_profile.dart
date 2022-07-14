import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mentorskill/controller/bottom_navi.dart';
import 'package:mentorskill/model/user_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  //controller
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  // TextEditingController genderController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController handphoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //style
  TextStyle style = TextStyle(fontSize: 20, color: Colors.white);
  TextStyle style2 = TextStyle(fontSize: 45, fontWeight: FontWeight.bold);
  TextStyle style3 = TextStyle(fontSize: 15);
  //variabel
  String jkel = 'Pria';
  DateTime? _selectedDate;
  //firebase
  final _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  
  @override
  void initState() {
    super.initState();
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get()
          .then((value) {
        this.loggedInUser = UserModel.fromMap(value.data());
        setState(() {
          fullNameController.text = '${loggedInUser.nama}';
          birthdayController.text = '${loggedInUser.tglLahir}';
          handphoneController.text = '${loggedInUser.phone}';
          jkel = '${loggedInUser.jkel}';
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    birthdayController.dispose();
    handphoneController.dispose();
    super.dispose();
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
                      'Edit Profil',
                      style: GoogleFonts.poppins(textStyle: style2),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          'Nama Lengkap',
                          style: GoogleFonts.poppins(textStyle: style3),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: fullNametext(),
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
                      Flexible(
                        flex: 1,
                        child: Text(
                          'Jenis Kelamin',
                          style: GoogleFonts.poppins(textStyle: style3),
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 2,
                              child: RadioListTile(
                                  value: 'Pria',
                                  groupValue: jkel,
                                  title: Text('Pria',
                                      style: GoogleFonts.poppins(
                                          textStyle: style3)),
                                  activeColor: Colors.black,
                                  onChanged: (value) {
                                    setState(() {
                                      jkel = value.toString();
                                    });
                                  }),
                            ),
                            Flexible(
                              flex: 2,
                              child: RadioListTile(
                                  value: 'Wanita',
                                  groupValue: jkel,
                                  title: Text('Wanita',
                                      style: GoogleFonts.poppins(
                                          textStyle: style3)),
                                  activeColor: Colors.black,
                                  onChanged: (value) {
                                    setState(() {
                                      jkel = value.toString();
                                    });
                                  }),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          'Tanggal Lahir',
                          style: GoogleFonts.poppins(textStyle: style3),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: birthdayText(),
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
                      Flexible(
                        flex: 3,
                        child: Text(
                          'Handphone',
                          style: GoogleFonts.poppins(textStyle: style3),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: handphoneText(),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      editProfile();
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
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField handphoneText() => TextFormField(
        controller: handphoneController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Handphone',
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

  TextFormField birthdayText() => TextFormField(
        controller: birthdayController,
        onTap: () {
          _selectDate(context);
        },
        decoration: InputDecoration(
            labelText: 'Tanggal Lahir',
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            )),
      );

  TextFormField fullNametext() => TextFormField(
        controller: fullNameController,
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

  void editProfile() async {
//Post Edit Profile to users

    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;
      UserModel userModel = UserModel();

      //Writing data
      userModel.phone = handphoneController.text;
      userModel.tglLahir = birthdayController.text;
      userModel.jkel = jkel;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
        'nama': fullNameController.text,
        'tglLahir': birthdayController.text,
        'phone': int.parse(handphoneController.text.toString()),
        'jkel': jkel,
      });
      var snackBar = SnackBar(
        content: Text('Simpan Berhasil'),
        duration: Duration(milliseconds: 700),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomNavi()));
    } catch (e) {
      var errorSnackBar = SnackBar(
        content: Text('Tidak Tersimpan'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
    }
  }

// void _fetchUserData() async {
//     try {
//       User _currentUser = FirebaseAuth.instance.currentUser!;
//       String authid = _currentUser.uid;
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc(user!.uid)
//           .get()
//           .then((value) {
//         this.loggedInUser = UserModel.fromMap(value.data());
//         setState(() {
//           fullNameController.text = '${loggedInUser.nama}';
//           birthdayController.text = '${loggedInUser.tglLahir}';
//           handphoneController.text = '${loggedInUser.phone}';
//         });
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(1945),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.yellow,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      birthdayController
        ..text = DateFormat('dd-MM-yyyy').format(_selectedDate!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: birthdayController.text.length,
            affinity: TextAffinity.upstream));
    } else {
      print("Date is not selected");
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
