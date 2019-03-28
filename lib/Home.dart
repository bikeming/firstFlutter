import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();
    return Scaffold(
        appBar: AppBar(title: Text("newpage2")),
        body: Center(child: new Text(wordPair.asPascalCase)));
  }
}
