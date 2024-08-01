import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/fronted/components/form_widget.dart';
import 'package:ninenty_second_per_word_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({super.key});

  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arg = ModalRoute.of(context)?.settings.arguments;
    final index = arg is int ? arg : 0;
    final model = context.read<NotesProvider>();

    // Set the controllers with the note data
    model.setControllers(index);
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      body: FormWidget(
        buttonName: 'Edit the ',
        func: () => model.onChange(context, model.editingIndex),
      ),
    );
  }
}