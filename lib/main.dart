import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mentorskill/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDVvbAe0ZdPWzsUMDrFwdpUOn0sdM48Ugg",
        appId: "1:1030438134466:web:5eda5ac8b9d8091bcd915b",
        messagingSenderId: "1030438134466",
        projectId: "mentorskill-eef4f"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
