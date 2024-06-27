import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';
import 'package:ninenty_second_per_word_app/fronted/components/word_text_field.dart';
import 'package:ninenty_second_per_word_app/fronted/components/new_card_texts.dart';
import 'package:ninenty_second_per_word_app/fronted/components/sentence_text_field.dart';
import 'package:ninenty_second_per_word_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';

class AddingCardPage extends StatelessWidget {
  AddingCardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: ListView(
        children: [
          const NewCardText(),
          const SizedBox(
            height: 40,
          ),
          WordTextField(
            wordController: model.wordController,
          ),
          const SizedBox(
            height: 20,
          ),
          SentenceTextField(
            sentenceController: model.sentenceController,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(50)),
              height: 50,
              width: 100,
              child: TextButton(
                onPressed: () { 
                model.addNote();
                },
                
                child: const Text(
                  'Add card',
                  style: TextStyle(color: Color.fromARGB(181, 137, 49, 172)),
                ),
              ))
        ],
      ),
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