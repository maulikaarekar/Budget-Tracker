import 'package:flutter/material.dart';
import 'package:flutter_app/languages.dart';
import 'package:flutter_app/transcriptor.dart';

class ListerApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ListerAppState();
}

class ListerAppState extends State<ListerApp> {
  Language selectedLang = languages.first;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Row(children: [
            new Image.asset('assets/sytody.png', fit: BoxFit.fitHeight),
            new Text('Shopping list'),
          ]),
          backgroundColor: Colors.blueGrey,
          actions: [
            new PopupMenuButton<Language>(
              onSelected: _selectLangHandler,
              itemBuilder: (BuildContext context) => _buildLanguagesWidgets,
            )
          ]),
        body: new TranscriptorWidget(lang: selectedLang),
      ));
  }

  List<CheckedPopupMenuItem<Language>> get _buildLanguagesWidgets => languages
    .map((l) => new CheckedPopupMenuItem<Language>(
    value: l,
    checked: selectedLang == l,
    child: new Text(l.name),
  ))
    .toList();

  void _selectLangHandler(Language lang) {
    setState(() => selectedLang = lang);
  }
}