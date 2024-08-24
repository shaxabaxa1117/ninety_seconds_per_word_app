import 'package:choice/choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ninenty_second_per_word_app/database/deck_data.dart';
import 'package:ninenty_second_per_word_app/database/hive_box.dart';

import 'package:ninenty_second_per_word_app/fronted/components/others/new_card_texts.dart';

import 'package:ninenty_second_per_word_app/fronted/components/sentence_text_field.dart';
import 'package:ninenty_second_per_word_app/fronted/components/word_text_field.dart';
import 'package:ninenty_second_per_word_app/provider/deck_provider.dart';
import 'package:ninenty_second_per_word_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';

class FormWidget extends StatefulWidget {
  const FormWidget(
      {super.key,
      required this.buttonName,
      required this.func,
      this.isAddingCard = false,
      this.forChanges = true});
  final String buttonName;
  final Function func;
  final bool isAddingCard;
  final bool forChanges;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  String? selectedValue;
  int? selectedIndex;

  void setSelectedValue(String? value) {
    setState(() {
      selectedValue = value;
    });
  }

  bool bottomBarIsOpen = false;
  @override
  Widget build(BuildContext context) {
    final deckModel = context.watch<DeckProvider>();
    final wordController = context.read<NotesProvider>().wordController;
    final sentenceController = context.read<NotesProvider>().sentenceController;
    final allDecks = HiveBox.decks.values.toList();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: CardText(
                  word: widget.buttonName,
                  isNotPlurar: widget.forChanges,
                ),
              ),
              
              Row(children: [Spacer(),IconButton(onPressed: (){Navigator.pushNamed(context, '/home_page');}, icon: Icon(Icons.cancel,size: 32,))])
            ],
          ),
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
          widget.isAddingCard == false
              ? Container(
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(50)),
                  height: 50,
                  width: 100,
                  child: TextButton(
                    onPressed: () {
                      widget.func();
                    },
                    child: Text(
                      widget.buttonName + ' card',
                      style: TextStyle(
                          color: Color.fromARGB(181, 137, 49, 172)),
                    ),
                  ))
              : Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                            onPressed: () {
                              bottomBarIsOpen = true;
                              showBottomSheet(
                                enableDrag: false,
                                backgroundColor:
                                    Color.fromARGB(255, 120, 120, 118),
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    width: double.infinity,
                                    child: InlineChoice<String>.single(
                                      listBuilder: ChoiceList.createWrapped(
                                        spacing: 10,
                                        runSpacing: 10,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 25,
                                        ),
                                      ),
                                      clearable: true,
                                      value: selectedValue,
                                      onChanged: setSelectedValue,
                                      itemCount: allDecks.length,
                                      itemBuilder: (state, i) {
                                        allDecks[i].deckIndex = i;
                                        return GestureDetector(
                                          onTap: () {
                                            setSelectedValue(allDecks[i]
                                                .name
                                                .toString());
                                            Navigator.pop(context);
                                          },
                                          child: ChoiceChip(
                                            selected: state.selected(
                                                allDecks[i]
                                                    .name
                                                    .toString()),
                                            onSelected: state.onSelected(
                                              allDecks[i].name.toString(),
                                              onChanged: (value) {
                                                deckModel.getIndex(
                                                    index: i);
                                              },
                                            ),
                                            label: Text(allDecks[i]
                                                .name
                                                .toString()),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              selectedValue == null
                                  ? 'Choose the deck'
                                  : selectedValue.toString(),
                              style: TextStyle(
                                  color: Color.fromARGB(181, 70, 36, 78)),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                            onPressed: () {
                              var decks = HiveBox.decks.values.toList();
                              decks[deckModel.deckIndex!].isFull
                                  ? showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Warning'),
                                        content: Text(
                                            'Your deck is full. Please, try adding the card to another deck'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Approve',style: TextStyle(color: Colors.black),),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                        backgroundColor: Color.fromARGB(
                                            255, 154, 154, 146),
                                      ),
                                    )
                                  : widget.func();
                                  
                            },
                            child: Text(
                              '${widget.buttonName}card',
                              style: TextStyle(
                                  color: Color.fromARGB(181, 70, 36, 78)),
                            ),
                          )),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
