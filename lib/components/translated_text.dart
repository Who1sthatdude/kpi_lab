import 'package:flutter/material.dart';
import 'action_button.dart';

class TranslateText extends StatefulWidget {
  TranslateText({Key? key, this.onTextTouched}) : super(key: key);

  final Function(bool)? onTextTouched;

  @override
  _TranslateTextState createState() => _TranslateTextState();
}

class _TranslateTextState extends State<TranslateText> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0.0),
      elevation: 2.0,
      child: Column(
        children: [
          Container(
            height: 225.0,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.5,
                  color: Colors.grey.shade500,
                ),
                top: BorderSide(
                  width: 0.5,
                  color: Colors.grey.shade500,
                ),
              ),
              color: Colors.black26
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      widget.onTextTouched!(true);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                          top: 8.0
                      ),
                      child: Text(
                        "Enter text",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black26,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ActionButton(
                  icon: Icons.camera_alt,
                  text: "Camera",
                ),
                ActionButton(
                  icon: Icons.supervisor_account,
                  text: "Conversation",
                ),
                ActionButton(
                  icon: Icons.record_voice_over,
                  text: "Speech into text",
                )
              ],
            )
          )
        ],
      )
    );
  }
}