import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  ActionButton({Key? key, this.icon, required this.text}) : super(key: key);

  final IconData? icon;
  final String text;

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {

  Widget _displayIcon(){
    if(widget.icon != null)
    {
      return Icon(
        widget.icon,
        color: Colors.blue[400],
        size: 23.0,
      );
    }
    else
    {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 2.0,
                bottom: 2.0
            )
        ),

        onPressed: () {},
        child: Column(
          children: <Widget>[
            _displayIcon(),
            Text(
              widget.text,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}