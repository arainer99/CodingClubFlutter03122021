import 'package:codingclub_031221/wordpair.service.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordGenerator extends StatelessWidget {
  WordGenerator({Key? key}) : super(key: key);

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  WordsService wordsService = WordsService();

  void addWordPair() {
    if (controller1.text.isEmpty || controller2.text.isEmpty) return;
    wordsService.addPair(controller1.text, controller2.text);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // Input 1
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: controller1,
              decoration: InputDecoration(
                hintText: 'Wort 1',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        // Input 2
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: controller2,
              decoration: InputDecoration(
                hintText: 'Wort 2',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        // Buttons
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 8.0, 0),
          child: ElevatedButton(
            onPressed: addWordPair,
            child: const Text("Wort hinzufügen"),
          ),
        ),
      ],
    );
  }
}
