

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ninenty_second_per_word_app/database/deck_data.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';
import 'package:ninenty_second_per_word_app/database/note_data.dart';
import 'package:ninenty_second_per_word_app/fronted/components/others/flip_card_page.dart';
import 'package:ninenty_second_per_word_app/fronted/components/others/new_card_texts.dart';
import 'package:ninenty_second_per_word_app/fronted/style/app_style.dart';
import 'package:ninenty_second_per_word_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class WordList extends StatelessWidget {
    WordList({super.key,required this.deckMainIndex});
    int deckMainIndex;
  @override
  Widget build(BuildContext context) {
    var model = context.watch<NotesProvider>();
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 34, 34),
      body: Stack(
        children: [
          Row(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 40,left: 10),
                child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.cancel,size: 35),),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                
                padding: EdgeInsets.only(top: 40),
                child: CardText(word:'List of ', isNotPlurar: false,)),
              ValueListenableBuilder(
                valueListenable: HiveBox.decks.listenable(),
                builder: (context, Box<DeckData> deck, _) {
                  var allDecks = deck.values.toList();
                  return Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 22),
                      itemBuilder: (context, index) {
                        return Card(
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WordFlipCard(
                                    index: index,
                                  ),
                                )),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(232, 145, 141, 140),
                              ),
                              child: ListTile(
                                //! элементы
                                title: Text(
                                  allDecks[deckMainIndex].notes![index].word.toString(),
                                  style: AppStyle.fontStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 59, 62, 62)),
                                ),
                                subtitle: Text(
                                  allDecks[deckMainIndex].notes![index].sentence.toString(),
                                  style: AppStyle.fontStyle.copyWith(
                                      fontSize: 14, color: Color.fromARGB(255, 59, 62, 62)),
                                ),
                                trailing: SizedBox(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/edit_page',
                                              arguments: index);
                                          model.setControllers(index);
                                        },
                                        icon: const Icon(Icons.edit_outlined),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          print(deckMainIndex);
                                          model.deleteNoteInDeck(deckIndex: deckMainIndex, noteIndex: index);
                                        },
                                        icon: const Icon(
                                          Icons.delete_outline,
                                        ),
                                      ),
                                      // IconButton(
                                      //   onPressed: () {
                                      //     model.onCheck(i, allNotes);
                                      //   },
                                      //   icon: Icon(
                                      //     Icons.check_circle_outline,
                   
                                      //     color: allNotes[i].isChecked ? Colors.green :AppColors.iconsColor,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, i) => const SizedBox(height: 10),
                      itemCount: allDecks[deckMainIndex].notes!.length,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
