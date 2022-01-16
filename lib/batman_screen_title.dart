import 'package:flutter/material.dart';

class BatmanScreenTitle extends AnimatedWidget {
  BatmanScreenTitle(Animation animation, {Key? key})
      : super(key: key, listenable: animation);

  Animation get _animationLogoMovementUp => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animationLogoMovementUp.value,
      child: Column(
        children: const [
          Text(
            'WELCOME TO',
            style: TextStyle(
                color: Colors.white, fontSize: 22),
          ),
          Text(
            'GOTHAM CITY',
            style: TextStyle(
                color: Colors.white, fontSize: 35),
          ),
        ],
      ),
    );
  }
}
