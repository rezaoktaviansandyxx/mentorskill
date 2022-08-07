import 'package:flutter/material.dart';
import 'package:mentorskill/dashboard.dart';
import 'package:mentorskill/page/inbox.dart';
import 'package:mentorskill/page/my_account.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({Key? key}) : super(key: key);

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int currentIndex = 0;
  final List<Widget> body = [
    const Dashboard(),
    Inbox(),
    const MyAccount(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: ontap,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              label: 'Beranda',
              activeIcon: Icon(
                Icons.home_outlined,
                color: Colors.amberAccent,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: Colors.purple,
              ),
              label: 'Kotak Masuk',
              activeIcon: Icon(
                Icons.email_outlined,
                color: Colors.teal,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_rounded,
                color: Colors.green,
              ),
              label: 'Akun Saya',
              activeIcon: Icon(
                Icons.account_circle_outlined,
                color: Colors.blue,
              )),
        ],
      ),
    );
  }

  void ontap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
