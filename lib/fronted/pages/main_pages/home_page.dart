import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';
import 'package:ninenty_second_per_word_app/database/note_data.dart';

import 'package:ninenty_second_per_word_app/fronted/components/others/new_card_texts.dart';
import 'package:ninenty_second_per_word_app/fronted/style/app_style.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Center(
            child: CardText(
          word: "Today's ",
          isNotPlurar: false,
        )),

      ],
    );
  }
}

class HomePageItems extends StatelessWidget {
        HomePageItems({super.key, required this.index, required this.allNotesFromProcessDeck});
        int index;
        List<NoteData>? allNotesFromProcessDeck;
                  @override
                Widget build(BuildContext context) {
                        return Card(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(232, 145, 141, 140),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18),
                            child: SizedBox(
                              height: 50,
                              child: ListTile(
                                
                                title: Padding(
                                  padding: EdgeInsets.only(bottom: 30),
                                  child: Text(
                                    allNotesFromProcessDeck![index].toString(),
                                    style: AppStyle.fontStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 59, 62, 62),),
                                  ),
                                ),
                                
                              ),
                            ),
                          ),
                        ),
                      );
  }
}