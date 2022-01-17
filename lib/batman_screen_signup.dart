import 'package:flutter/material.dart';

import 'batman_button.dart';

class BatmanScreenSignup extends AnimatedWidget {
  BatmanScreenSignup(Animation animation) : super(listenable: animation);

  Animation get _animationSignupIn => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Opacity(
        opacity: _animationSignupIn.value,
        child: Transform.translate(
          offset: Offset(0.0, 100.0 * (1 - _animationSignupIn.value)),
          child: Column(
            children: [
              const Text(
                'GET ACCESS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BatmanButton(
                text: 'SIGNUP',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
