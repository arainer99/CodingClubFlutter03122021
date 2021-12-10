import 'package:english_words/english_words.dart';

class WordsService {
  static final WordsService _instance = WordsService._internal();
  factory WordsService() => _instance;

  List<WordPair> wordPairs = <WordPair>[];

  addPair(String wort1, String wort2) {
    wordPairs.add(WordPair(wort1, wort2));
  }

  WordsService._internal() {
    //constructor
  }
}
