import 'package:batman_signup/batman_screen_buttons.dart';
import 'package:batman_signup/batman_screen_title.dart';
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
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationLogoIn;
  late Animation<double> _animationLogoMovementUp;
  late Animation<double> _animationBatmanIn;
  late Animation<double> _animationButtonsIn;

  late AnimationController _animationControllerSignup;
  late Animation<double> _animationLogoOut;

  void _setupFirstAnimations() {
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

    _animationLogoMovementUp = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.35, 0.60),
    );

    _animationBatmanIn = Tween(
      begin: 5.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.7,
          1.0,
          curve: Curves.decelerate,
        ),
      ),
    );

    _animationButtonsIn = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.7,
        1.0,
      ),
    );

    _animationController.forward();
  }

  void _setupSecondAnimations() {
    _animationControllerSignup = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    _animationLogoOut = CurvedAnimation(
      parent: _animationControllerSignup,
      curve: const Interval(0.0, 0.1),
    );
  }

  void _onSignUp() {
    _animationControllerSignup.forward(from: 0.0);
  }

  @override
  void initState() {
    _setupFirstAnimations();
    _setupSecondAnimations();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerSignup.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);
        _animationControllerSignup.reset();
      },
      child: AnimatedBuilder(
          animation: Listenable.merge(
              [_animationController, _animationControllerSignup]),
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
                    child: Transform.scale(
                      scale: _animationBatmanIn.value,
                      child: Image.asset(
                        'assets/batman_alone.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2,
                    right: 0,
                    left: 0,
                    child: Column(
                      children: [
                        Transform.translate(
                          offset: Offset(0.0, 60 * _animationLogoOut.value),
                          child: Opacity(
                            opacity: (1 - _animationLogoOut.value),
                            child: BatmanScreenTitle(_animationLogoMovementUp),
                          ),
                        ),
                        const SizedBox(height: 35),
                        Transform.translate(
                          offset: Offset(0.0, 60 * _animationLogoOut.value),
                          child: Opacity(
                            opacity: (1 - _animationLogoOut.value),
                            child: BatmanScreenButtons(
                                _animationButtonsIn, _onSignUp),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2.2 -
                        65 * _animationLogoMovementUp.value,
                    right: 0,
                    left: 0,
                    child: Opacity(
                      opacity: (1 - _animationLogoOut.value),
                      child: Transform.scale(
                        scale: _animationLogoIn.value,
                        child: Image.asset(
                          'assets/batman_logo.png',
                          height: 50,
                          fit: BoxFit.contain,
                        ),
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
