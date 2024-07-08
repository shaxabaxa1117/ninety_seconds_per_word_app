import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';
import 'package:ninenty_second_per_word_app/fronted/components/form_widget.dart';
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
    return FormWidget(buttonName: 'Create a new ', func: () => model.addNote(context));
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