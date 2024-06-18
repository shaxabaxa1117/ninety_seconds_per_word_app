


import 'package:flutter/material.dart';

class NewCardTextDecoration extends StatelessWidget {
  const NewCardTextDecoration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
              text: TextSpan(
    children: [
      const TextSpan(
        text: 'Create a new ',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.white,
          fontSize: 35,
        ),
      ),
      WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Transform.translate(
          offset: const Offset(0, -6), // Adjust the offset to move "card" higher
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color.fromARGB(255, 113, 129, 175), Color.fromARGB(255, 97, 77, 101)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Text(
              'card',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ],
              ),
            );
  }
}

