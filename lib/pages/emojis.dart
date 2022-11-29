import 'package:flutter/material.dart';
//import 'package:searchbar/utils/emojiface.dart';

class Emojis extends StatelessWidget {
  const Emojis({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'How do you feel?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '..',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
