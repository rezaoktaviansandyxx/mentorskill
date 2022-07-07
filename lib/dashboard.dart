import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
            child: Column(
              children: [
                Image.asset('assets/images/logomentor.png'),
                Row(
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      size: 30,
                    ),
                    Column(
                      children: [
                        Text('Selamat Datang'),
                        Text('USER'),
                      ],
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Container(
                      child: Text('Gambar'),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Column(
                      children: [
                        Text('Chat dengan Mentor'),
                        IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.whatsapp,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                Text('1. Dasar-dasar Teknologi'),
                Text('2. Pengembangan Android dengan Kotlin'),
                Text('3. Final Project'),
                // ElevatedButton.icon(
                //     onPressed: () {},
                //     icon: Icon(Icons.arrow_forward_rounded),
                //     label: ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
