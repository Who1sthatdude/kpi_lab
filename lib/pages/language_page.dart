import 'package:flutter/material.dart';
import '../models/language.dart';
import '../components/language_element.dart';

class LanguagePage extends StatefulWidget {
  LanguagePage({Key? key, required this.title, required this.isAutomaticEnabled}): super(key:key);

  final String title;
  final bool isAutomaticEnabled;

  @override
  _LanguagePageState createState() => _LanguagePageState();

}

class _LanguagePageState extends State<LanguagePage> {
  final TextEditingController _searchTextController = TextEditingController();
  final Set<Language> _languageList = {
    Language('be', 'Belarusian', false, false, true),
    Language('bg', 'Bulgarian', false, false, true),
    Language('zh-cn', 'Chinese Simplified', true, false, true),
    Language('zh-tw', 'Chinese Traditional', false, false, true),
    Language('cs', 'Czech', false, false, true),
    Language('da', 'Danish', false, false, true),
    Language('nl', 'Dutch', false, false, true),
    Language('en', 'English', true, true, true),
    Language('fi', 'Finnish', false, false, true),
    Language('fr', 'French', true, true, true),
    Language('de', 'German', false, false, true),
    Language('el', 'Greek', false, false, true),
    Language('it', 'Italian', false, false, true),
    Language('ja', 'Japanese', false, false, false),
    Language('ko', 'Korean', false, false, true),
    Language('pl', 'Polish', false, false, true),
    Language('pt', 'Portuguese', false, false, true),
    Language('ru', 'Russian', false, false, true),
    Language('sk', 'Slovak', false, false, true),
    Language('es', 'Spanish', false, false, true),
    Language('uk', 'Ukrainian', false, false, true),
  };

  @override
  void initState() {
    super.initState();

    if(!widget.isAutomaticEnabled) {
      var automaticElement = _languageList
          .where((language) => language.code == 'auto')
          .toList()[0];
      _languageList.remove(automaticElement);
    }
  }

  //Send back selected language
  _sendBackLanguage(Language language) {
    Navigator.pop(context, language);
  }


  Widget _displayListWithHeaders() {
    List<Language> recentLanguages = _languageList.where((lang) => lang.isRecent).toList();

    return Expanded(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => LanguageElement(
                language: _languageList.elementAt(index),
                onSelect: _sendBackLanguage,
              ),
              childCount: _languageList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget? _displayDeleteTextIcon() {
    if(_searchTextController.text.length > 0) {
      return IconButton(
        icon: Icon(Icons.close),
        color: Colors.grey,
        onPressed: () {
          setState(() {
            _searchTextController.text = "";
          });
        },
      );
    } else {
      return null;
    }
  }

  Widget _displaySearchedList() {
    List<Language> searchedList = _languageList
        .where((e) => e.name.toLowerCase().contains(_searchTextController.text.toLowerCase()))
        .toList();

    return Expanded(
      child: ListView.builder(
        itemCount: searchedList.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return LanguageElement(
            language: searchedList[index],
            onSelect: _sendBackLanguage,
          );
        },
      ),
    );
  }

  Widget _displayTheRightList() {
    if(_searchTextController.text == "") {
      return _displayListWithHeaders();
    } else {
      return _displaySearchedList();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
                top: 12.0,
                bottom: 12.0,
                left: 8.0,
                right: 8.0
            ),
            child: TextField(
              controller: _searchTextController,
              onChanged: (text) {
                setState(() {});
              },
              decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue.shade400)
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 24.0,
                    color: Colors.grey,
                  ),
                  suffixIcon: _displayDeleteTextIcon()
              ),
            ),
          ),
          _displayTheRightList(),
        ],
      ),
    );
  }
}