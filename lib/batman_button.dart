import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

const _imageColor = Color(0xFFC88853);

class BatmanButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool left;

  const BatmanButton(
      {Key? key, required this.onTap, required this.text, this.left = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFDE86A),
      child: InkWell(
        onTap: onTap,
        child: ClipRect(
          child: SizedBox(
            height: 55,
            child: Stack(
              children: [
                if (left)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(-10.0)
                        ..rotateZ(vector.radians(35)),
                      child: Image.asset(
                        'assets/batman_logo.png',
                        height: 40,
                        color: _imageColor,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (!left)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(10.0)
                        ..rotateZ(vector.radians(-35)),
                      child: Image.asset(
                        'assets/batman_logo.png',
                        height: 40,
                        color: _imageColor,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
