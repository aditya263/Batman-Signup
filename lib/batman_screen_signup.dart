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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'GET ACCESS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                const _BatmanInput(
                  label: 'FULL NAME',
                ),
                const _BatmanInput(
                  label: 'EMAIL ID',
                ),
                const _BatmanInput(
                  label: 'PASSWORD',
                  password: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                BatmanButton(
                  text: 'SIGNUP',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BatmanInput extends StatelessWidget {
  final String label;
  final bool password;

  const _BatmanInput({Key? key, required this.label, this.password = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
            color: Colors.grey[800],
          ),
          enabledBorder: border,
          border: border,
          suffixIcon: password
              ? Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: UnconstrainedBox(
                    child: Image.asset(
                      'assets/batman_logo.png',
                      height: 15,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
