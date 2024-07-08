import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';
import 'package:ninenty_second_per_word_app/database/note_data.dart';
import 'package:ninenty_second_per_word_app/fronted/components/flip_card_page.dart';
import 'package:ninenty_second_per_word_app/fronted/pages/main_pages/edit_note_page.dart';
import 'package:ninenty_second_per_word_app/fronted/style/app_colors.dart';
import 'package:ninenty_second_per_word_app/fronted/style/app_style.dart';
import 'package:ninenty_second_per_word_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';

//!For now there is going to be only list of words that are added but we must add deck components in the near future

class WordListPage extends StatelessWidget {
  const WordListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var model = context.watch<NotesProvider>();
    //var allNotes = HiveBox.notes.values.toList();//! other option for giving data for each widget

    return ValueListenableBuilder(
      valueListenable: HiveBox.notes.listenable(),
      builder: (context, Box<NoteData> notes, _) {
        var allNotes = notes.values.toList();
        return ListView.separated(
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
                      allNotes[index].word.toString(),
                      style: AppStyle.fontStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 59, 62, 62)),
                    ),
                    subtitle: Text(
                      allNotes[index].sentence.toString(),
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
            );
          },
          separatorBuilder: (context, i) => const SizedBox(height: 10),
          itemCount: allNotes.length,
        );
      },
    );
  }
}
