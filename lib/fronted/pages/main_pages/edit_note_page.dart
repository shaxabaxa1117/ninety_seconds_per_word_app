

import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/fronted/components/new_card_texts.dart';
import 'package:ninenty_second_per_word_app/fronted/components/sentence_text_field.dart';
import 'package:ninenty_second_per_word_app/fronted/components/word_text_field.dart';
import 'package:ninenty_second_per_word_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';

class EditNotePage  extends StatelessWidget {
  EditNotePage ({super.key, required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    
    final model = context.watch<NotesProvider>();
    final wordController = context.read<NotesProvider>().wordController;
    final sentenceController = context.read<NotesProvider>().sentenceController;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20,),
          child: ListView(
            children: [
              CardText(word:'Edit the ',),
              const SizedBox(
                height: 40,
              ),
              WordTextField(
                wordController: wordController,
              ),
              const SizedBox(
                height: 20,
              ),
              SentenceTextField(
                sentenceController: sentenceController,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(50)),
                  height: 50,
                  width: 100,
                  child: TextButton(
                    onPressed: () { 
                    model.onChange(context, index);
                    print('hello');
                    },
                    
                    child: const Text(
                      'Edit card',
                      style: TextStyle(color: Color.fromARGB(181, 137, 49, 172)),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

