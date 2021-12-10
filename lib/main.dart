import 'package:codingclub_031221/genartewords.dart';
import 'package:codingclub_031221/wordpair.service.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Unsere Supercoole App"),
        ),
        body: Column(
          children: <Widget>[
            WordGenerator(),
            RandomWords(),
          ],
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordState createState() {
    return _RandomWordState();
  }
}

class _RandomWordState extends State<RandomWords> {
  WordsService wordsService = WordsService();

  final List<WordPair> _wortPaare = <WordPair>[];

  Widget _buildWordPairs() {
    _wortPaare.addAll(wordsService.wordPairs);
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return const Divider(
            thickness: 2.0,
          );
        }
        final index = i ~/ 2;
        if (index >= _wortPaare.length) {
          _wortPaare.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_wortPaare[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asCamelCase,
        style: const TextStyle(fontSize: 18.0),
      ),
      contentPadding: EdgeInsets.all(8.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _buildWordPairs(),
    );
  }
}
