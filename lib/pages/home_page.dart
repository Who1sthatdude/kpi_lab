import 'package:flutter/material.dart';
import 'package:kpi_lab/pages/saved_words_page.dart';
import '../components/translate_input.dart';
import '../models/language.dart';
import '../components/choose_language.dart';
import '../components/translated_text.dart';
import '../components/list_translate.dart';
import '../components/avatar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title, required this.switchTheme}) : super(key: key);

  final String title;
  Function switchTheme;

  @override
  _HomePageState createState() => _HomePageState(switchTheme);
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool _isTextTouched = false;
  Language _firstLanguage = Language('en', 'English', true, true, true);
  Language _secondLanguage = Language('es', 'Spanish', true, true, true);
  FocusNode _textFocusNode = FocusNode();
  Function switchTheme;

  int _counter = 0;
  int _selectedIndex = 0;

  void changeCounter(){
    setState(() {
      _counter += 1;
    });
  }

  void _onBottomIconTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if(_selectedIndex == 1)
    {
      getSavedWordsPage(widget.title);
    }
  }

  void getSavedWordsPage(String title) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SavedWordsPage(
              title: title,
            ),
      ),
    );
  }



  void _onLanguageChanged(Language first, Language second) {
    setState(() {
      _firstLanguage = first;
      _secondLanguage = second;
    });
  }

  _HomePageState(this.switchTheme);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF212121),
        child: const Icon(Icons.add, color: Colors.white, size: 24),
        onPressed: (){
          switchTheme();
        },
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Nikita Nesterov TI-81'),
                  Text('Counter: $_counter'),
                ],
              ),
            ),
          ],
        ),
      ),

      appBar:AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Hero(
              tag: "avatar",
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(0))),
                child: const CircleAvatar(
                  foregroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/d/db/Google_Translate_Icon.png'),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      CustomPageRoute((AvatarScreen())));
                },
              )
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[400],
        onTap: _onBottomIconTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Saved',

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings'
          )
        ],
      ),

      body: Column(
        children: <Widget>[
          ChooseLanguage(
            onLanguageChanged: _onLanguageChanged,
          ),
          Stack(
            children: <Widget>[
              Offstage(
                offstage: _isTextTouched,
                child: TranslateText(
                ),
              ),
              Offstage(
                offstage: !_isTextTouched,
                child: TranslateInput(
                  focusNode: _textFocusNode,
                  firstLanguage: _firstLanguage,
                  secondLanguage: _secondLanguage,
                ),
              )
            ],
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 8.0),
                  child: ListTranslate(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}