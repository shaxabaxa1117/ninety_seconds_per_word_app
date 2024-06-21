// ignore_for_file: prefer_const_constructors

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';




class WordFlipCard extends StatelessWidget {

  String word = 'coworking';
  String sentence = 'Coworking is essential part of my life ';
  WordFlipCard({super.key});
  @override
  Widget build(BuildContext context) {
    return 
          Center(
          child: FlipCard(
            direction: FlipDirection.HORIZONTAL, // направление переворота (горизонтально или вертикально)
            front: Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color.fromARGB(255, 83, 95, 106),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      word,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  
                ],
              ),
            ),
            back: Container(
              width: double.infinity,
              height: double.infinity,
              color: Color.fromARGB(255, 66, 48, 67),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sentence,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Text('Translфtion')
                  ],
                ),
              ),
            ),
          ),
        );
  }
}


