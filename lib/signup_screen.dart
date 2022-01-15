import 'package:batman_signup/batman_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainBatmanSignupApp extends StatelessWidget {
  const MainBatmanSignupApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        textTheme: GoogleFonts.vidalokaTextTheme(),
      ),
      child: const BatmanSignup(),
    );
  }
}

class BatmanSignup extends StatelessWidget {
  const BatmanSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF100F0B),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Image.asset(
              'assets/batman_background.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Image.asset(
              'assets/batman_alone.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.5,
            right: 0,
            left: 0,
            child: Image.asset(
              'assets/batman_logo.png',
              height: 50,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2,
            right: 0,
            left: 0,
            child: Column(
              children: [
                const Text(
                  'WELCOME TO',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                const Text(
                  'GOTHAM CITY',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
                const SizedBox(height: 35,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      BatmanButton(onTap: (){}, text: 'LOGIN'),
                      const SizedBox(height: 20,),
                      BatmanButton(onTap: (){}, text: 'SIGNUP',left: false,),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
