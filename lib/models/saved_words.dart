import 'package:flutter/material.dart';
import 'translated.dart';

class SavedWords extends ChangeNotifier {
  final List<TranslatedWord> favorites = [];

  void add(TranslatedWord item) {
    favorites.add(item);
    notifyListeners();
  }

  bool isFavourite(TranslatedWord item)
  {
    return favorites.contains(item);
  }

  void remove(TranslatedWord item) {
    favorites.remove(item);
    notifyListeners();
  }
}