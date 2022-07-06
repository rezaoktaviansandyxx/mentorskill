import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mentorskill/controller/login.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  TextStyle style = TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700);
  TextStyle style2 = TextStyle(fontSize: 19.0);
  TextStyle style3 = TextStyle(fontSize: 13.0, fontWeight: FontWeight.w700);

  void _onIntroEnd(context) {
    introKey.currentState?.animateScroll(0);
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = GoogleFonts.poppins(textStyle: style2);

    var pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.poppins(textStyle: style),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.transparent,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.blue,
      globalHeader: Align(
        alignment: Alignment.topRight,
      ),
      pages: [
        PageViewModel(
          title: 'Ayo tentukan minat dan skillmu',
          body:
              '"Sebelum kamu menjadi seorang pemimpin, kesuksesan adalah tentang mengembangkan dirimu. Ketika kamu menjadi seorang pemimpin, kesuksesan adalah tentang mengembangkan orang lain." - Jack Welch',
          image: Image.asset(
            'assets/images/mentoring.png',
            width: 350,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Langsung belajar dari ahlinya',
          body:
              '"Semua perkembangan tergantung dari aktivitasnya. Tidak akan ada pembangunan secara fisik maupun intelektual tanpa adanya usaha, di mana usaha tersebut berarti bekerja keras." - Calvin Coolidge',
          image: Image.asset(
            'assets/images/mentoring2.png',
            width: 350,
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      showDoneButton: true,
      showNextButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Login()));
        },
        child: Text(
          'Mulai',
          style: GoogleFonts.poppins(textStyle: style3),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
