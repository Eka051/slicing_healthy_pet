import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_pet/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    });
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/background.png'),
          Center(
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 42,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  height: 22,
                ),
                const SizedBox(
                  height: 73,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Helping you\n to keep ',
                        style: GoogleFonts.manrope(
                            fontSize: 24,
                            color: Color(0xFFDEE1FE),
                            letterSpacing: 3.5 / 100,
                            height: 152 / 100),
                        children: [
                          TextSpan(
                              text: 'your bestie\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white)),
                          TextSpan(text: 'stay healthy!')
                        ])),
              ],
            )),
          )
        ],
      ),
    );
  }
}
