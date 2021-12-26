import 'package:flutter/material.dart';
import '../models/language.dart';
import '../pages/language_page.dart';

class ChooseLanguage extends StatefulWidget {
  ChooseLanguage({Key? key, required this.onLanguageChanged}) : super(key: key);

  final Function(Language firstCode, Language secondCode) onLanguageChanged;

  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  Language _firstLanguage = Language("ru", "Russian", true, true, true);
  Language _secondLanguage = Language("en", "English", true, true, true);

  void _switchLanguage() {
    Language _tmpLanguage = _firstLanguage;

    setState(() {
      _firstLanguage = _secondLanguage;
      _secondLanguage = _tmpLanguage;
    });

    widget.onLanguageChanged(_firstLanguage, _secondLanguage);
  }

  void _chooseFirstLanguage(String title, bool isAutomaticEnabled) async {
    final language = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LanguagePage(
          title: title,
          isAutomaticEnabled: isAutomaticEnabled,
        ),
      ),
    );

    if(language != null) {
      setState(() {
        _firstLanguage = language;
      });
      widget.onLanguageChanged(_firstLanguage, _secondLanguage);
    }
  }

  void _chooseSecondLanguage(String title, bool isAutomaticEnabled) async {
    final language = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LanguagePage(
          title: title,
          isAutomaticEnabled: isAutomaticEnabled,
        ),
      ),
    );

    if(language != null) {
      setState(() {
        _secondLanguage = language;
      });
      widget.onLanguageChanged(_firstLanguage, _secondLanguage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Material(
              child: InkWell(
                onTap: () {
                  _chooseFirstLanguage("Translate from", true);
                },
                child: Center(
                  child: Text(
                    _firstLanguage.name,
                    style: TextStyle(
                      color: Colors.blue[400],
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Material(
            child: IconButton(
              icon: Icon(
                Icons.compare_arrows,
                color: Colors.grey[400],
              ),
              onPressed: () {
                _switchLanguage();
              },
            ),
          ),
          Expanded(
            child: Material(
              child: InkWell(
                onTap: () {
                  _chooseSecondLanguage("Translate to", false);
                },
                child: Center(
                  child: Text(
                    _secondLanguage.name,
                    style: TextStyle(
                      color: Colors.blue[400],
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
