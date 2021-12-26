import 'package:flutter/material.dart';
import '../models/language.dart';

class LanguageElement extends StatefulWidget {
  LanguageElement({Key? key, required this.language, required this.onSelect}): super(key: key);

  final Language language;
  final Function(Language) onSelect;

  @override
  _LanguageElementState createState() => _LanguageElementState();
}

class _LanguageElementState extends State<LanguageElement> {

  Widget? _displayTrailingIcon() {
    if(widget.language.isDownloadable) {
      if(widget.language.isDownloaded) {
        return const Icon(Icons.check_circle);
      } else {
        return const Icon(Icons.file_download);
      }
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.language.name),
      trailing: _displayTrailingIcon(),
      onTap: () {
        widget.onSelect(widget.language);
      },
    );
  }
}