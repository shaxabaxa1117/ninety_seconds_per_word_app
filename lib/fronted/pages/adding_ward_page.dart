import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/fronted/components/app_text_field.dart';

class AddingPage extends StatelessWidget {
  const AddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text('Every word has certain meaning, so be meaningful.'),
        Text('The word or phrase'),
        AppTextField(),
        Text('The sentence that consists of this word or phrase'),
        AppTextField(),

        ElevatedButton(onPressed: (){}, child: Text('Add card'))

      ],),
    );
  }
}


