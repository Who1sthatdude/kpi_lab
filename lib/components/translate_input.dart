import 'package:flutter/material.dart';
import '../models/language.dart';

class TranslateInput extends StatefulWidget {
  TranslateInput({
    Key? key,
    this.onCloseClicked,
    required this.focusNode,
    required this.firstLanguage,
    required this.secondLanguage})
      : super(key: key);

  Function(bool)? onCloseClicked;
  final FocusNode focusNode;
  final Language firstLanguage;
  final Language secondLanguage;

  @override
  _TranslateInputState createState() => _TranslateInputState();
}

class _TranslateInputState extends State<TranslateInput> {
  String _textTranslated = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16.0),
              child: TextField(
                focusNode: widget.focusNode,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: RawMaterialButton(
                    onPressed: () {
                        widget.onCloseClicked!(false);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                    shape: new CircleBorder(),
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _textTranslated,
                    style: TextStyle(color: Colors.blue[700]),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}