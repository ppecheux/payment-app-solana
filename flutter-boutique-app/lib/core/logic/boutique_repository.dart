import 'package:sollet/models/boutique.dart';

class BoutiqueRepository {
  final List<Boutique> _boutiqueList = [
    Boutique(
      "Cake shop",
      "Cake shop",
      "Cake shop for lovers",
      "https://img.freepik.com/vecteurs-premium/cupcake-logo-sweet-cake-logo-cake-shop-logo-cake-bakery-logo-vector-logotemplate_180795-14.jpg?w=996",
      ["#Cake"],
    ),
    Boutique(
      "Pet shop",
      "Pet Shop",
      "Buy many pets here",
      "https://i.guim.co.uk/img/media/03734ee186eba543fb3d0e35db2a90a14a5d79e3/0_173_5200_3120/master/5200.jpg?width=700&quality=85&dpr=1&s=none",
      ["#Pets"],
    ),
  ];

  Future<List<Boutique>> get boutiques async {
    return _boutiqueList;
  }

  Boutique findByShortName(String shortName) {
    return _boutiqueList
        .firstWhere((element) => element.shortName == shortName);
  }
}
