


import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/fronted/components/main_word_text_field.dart';
import 'package:ninenty_second_per_word_app/fronted/components/new_card_texts.dart';
import 'package:ninenty_second_per_word_app/fronted/components/sentence_text_field.dart';

class AddingPage extends StatelessWidget {
  const AddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: ListView(
            children: [
              const NewCardTextDecoration(),
              const SizedBox(
                height: 40,
              ),
              TextInputWidget(),
              const SizedBox(
                height: 20,
              ),
              SentenceTextField(),
              SizedBox(
                  child:
                      ElevatedButton(onPressed: () {}, child: const Text('Add card')))
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