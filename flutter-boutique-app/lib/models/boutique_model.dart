import 'package:flutter/material.dart';
import 'package:sollet/models/boutique.dart';

class BoutiqueProvider extends ChangeNotifier {
  List<Boutique> selectedBoutiques = [];
  bool addBoutique(Boutique boutique) {
    if (selectedBoutiques
        .any((element) => element.shortName == boutique.shortName)) {
      return false;
    } else {
      selectedBoutiques.add(boutique);
    }
    notifyListeners();
    return true;
  }

  bool deleteBoutique(Boutique boutique) {
    if (!selectedBoutiques
        .any((element) => element.shortName == boutique.shortName)) {
      return false;
    } else {
      selectedBoutiques
          .removeWhere((element) => element.shortName == boutique.shortName);
    }
    notifyListeners();
    return true;
  }
}
