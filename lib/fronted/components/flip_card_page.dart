// ignore_for_file: prefer_const_constructors

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';




class WordFlipCard extends StatelessWidget {

  int index;
  WordFlipCard({super.key,required this.index});
  @override
  Widget build(BuildContext context) {
    var allNotes = HiveBox.notes.values.toList();
    return 
          Scaffold(
            backgroundColor: Color.fromARGB(255, 34, 34, 34),
            appBar: AppBar(
          title: const Text(
            'Card',
            style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 59, 59, 59),
        ),
            body:  Center(
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL, // направление переворота (горизонтально или вертикально)
              front: Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color.fromARGB(255, 83, 95, 106),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        allNotes[index].word!,
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
                        allNotes[index].sentence!,
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
                    ),
          );
  }
}


