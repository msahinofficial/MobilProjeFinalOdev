import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../HomeScreen/HomeScreen.dart';
import '../screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ilk açılan sayfa sonra 3 saniye bekleyip yeni sayfaya geçiyor
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage("images/splash_screen.png"),
                fit: BoxFit.cover,
                opacity: 0.5)),
        child: Center(
          child: Text(
            "Games",
            style: GoogleFonts.lobster(
                color: Colors.white, fontSize: 70, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
