import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: RandomWords(),
    );
  }
}
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

    final List<WordPair> _suggestions = <WordPair>[];
    final TextStyle _biggerFont = const TextStyle(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      color: Colors.blue
    );

    Widget _buildSuggestions(){
      return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, i) {
          if (i.isOdd)
            return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
    }

    Widget _buildRow(WordPair pair){
      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Startup Name Generator',
              style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.normal
        ),
        ),
      ),
      body: _buildSuggestions(),
    );
  }
}