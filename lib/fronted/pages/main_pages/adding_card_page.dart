import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';
import 'package:ninenty_second_per_word_app/fronted/components/form_widget.dart';
import 'package:ninenty_second_per_word_app/provider/deck_provider.dart';
import 'package:ninenty_second_per_word_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';

class AddingCardPage extends StatelessWidget {
  const AddingCardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final modelNote = context.watch<NotesProvider>();
    final modelDeck = context.watch<DeckProvider>();
    var allNotes = HiveBox.notes.values.toList();
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 34, 34),
      body: FormWidget(
          buttonName: 'Create a new ',
          isAddingCard: true,
          func: () {
            
            modelNote.addNote(context);
            modelDeck.addNoteToDeck(context);


          }),
    );
  }
}







// child: ListView(
//           children: [
//             NewCardTextDecoration(),
//             SizedBox(
//               height: 40,
//             ),
//             TextInputWidget(),
//             SizedBox(
//               height: 20,
//             ),
//             SentenceTextField(),
//             SizedBox(
//                 child:
//                     ElevatedButton(onPressed: () {}, child: Text('Add card')))
//           ],
//         ),