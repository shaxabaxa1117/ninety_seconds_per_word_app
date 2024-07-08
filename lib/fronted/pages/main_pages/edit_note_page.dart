import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/fronted/components/form_widget.dart';
import 'package:ninenty_second_per_word_app/fronted/components/new_card_texts.dart';
import 'package:ninenty_second_per_word_app/fronted/components/sentence_text_field.dart';
import 'package:ninenty_second_per_word_app/fronted/components/word_text_field.dart';
import 'package:ninenty_second_per_word_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments;
    final index = arg is int ? arg : 0;
    final model = context.watch<NotesProvider>();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 34, 34),
      body: FormWidget(
        buttonName: 'Edit the ',
        
        func: () => model.onChange(context, index),
      ),
    );
  }
}
