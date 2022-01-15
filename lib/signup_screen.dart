import 'dart:ffi';

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

class BatmanSignup extends StatefulWidget {
  const BatmanSignup({Key? key}) : super(key: key);

  @override
  State<BatmanSignup> createState() => _BatmanSignupState();
}

class _BatmanSignupState extends State<BatmanSignup>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationLogoIn;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _animationLogoIn = Tween(
      begin: 30.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.25),
      ),
    );

    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);
      },
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
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
                        const SizedBox(
                          height: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            children: [
                              BatmanButton(onTap: () {}, text: 'LOGIN'),
                              const SizedBox(
                                height: 20,
                              ),
                              BatmanButton(
                                onTap: () {},
                                text: 'SIGNUP',
                                left: false,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2.5,
                    right: 0,
                    left: 0,
                    child: Transform.scale(
                      scale: _animationLogoIn.value,
                      child: Image.asset(
                        'assets/batman_logo.png',
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
