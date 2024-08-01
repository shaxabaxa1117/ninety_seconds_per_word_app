import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ninenty_second_per_word_app/database/deck_data.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';
import 'package:ninenty_second_per_word_app/database/note_data.dart';
import 'package:ninenty_second_per_word_app/fronted/components/flip_card_page.dart';
import 'package:ninenty_second_per_word_app/fronted/components/word_list.dart';
import 'package:ninenty_second_per_word_app/fronted/pages/main_pages/edit_note_page.dart';
import 'package:ninenty_second_per_word_app/fronted/style/app_colors.dart';
import 'package:ninenty_second_per_word_app/fronted/style/app_style.dart';
import 'package:ninenty_second_per_word_app/provider/deck_provider.dart';
import 'package:ninenty_second_per_word_app/provider/notes_provider.dart';

import 'package:provider/provider.dart';

//!For now there is going to be only list of words that are added but we must add deck components in the near future

class DeckListPage extends StatelessWidget {
  const DeckListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var model = context.watch<DeckProvider>();

    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: HiveBox.decks.listenable(),
          builder: (context, Box<DeckData> decks, _) {
            var allDecks = decks.values.toList();
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WordList(
                                deckMainIndex: index,
                              ),
                            ));
                      },
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(232, 145, 141, 140),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 28),
                            child: SizedBox(
                              height: 80,
                              child: ListTile(
                                //! элементы

                                title: Text(
                                  allDecks[index].name.toString(),
                                  style: AppStyle.fontStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 59, 62, 62)),
                                ),
                                trailing: SizedBox(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Changing the name of deck'),
                                                content: TextField(
                                                  controller:
                                                      model.deckNameController,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          "Enter your input here"),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    child: const Text('Cancel'),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: const Text('Change'),
                                                    onPressed: () {
                                                      model.onChange(
                                                          context, index);
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(Icons.edit_outlined),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          model.deleteNote(index);
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
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: allDecks.length,
                ),
              ),
            );
          },
        ),
        IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Input Dialog'),
                    content: TextField(
                      controller: model.deckNameController,
                      decoration: InputDecoration(
                          hintText: "Enter the name of new deck"),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Add deck'),
                        onPressed: () {
                          model.addDeck(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.add))
      ],
    );
  }
}
