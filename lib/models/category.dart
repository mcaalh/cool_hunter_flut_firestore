class Category {
  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        categorie = json['categorie'].toString(),
        menu = json['menu'].toString(),
        partenaires = json['partenaires'].toString(),
        themes = json['themes'].toString(),
        nbrLangues = json['nbrLangues'].toString(),
        titre = json['titre'].toString(),
        imageURL = json['imageURL'].toString(),
        sousTitres = json['sousTitres'].toString(),
        fr = json['fr'].toString(),
        en = json['en'].toString(),
        es = json['es'].toString(),
        it = json['it'].toString(),
        de = json['de'].toString(),
        pt = json['pt'].toString(),
        ru = json['ru'].toString(),
        ar = json['ar'].toString(),
        zh = json['zh'].toString(),
        ja = json['ja'].toString();

  late final String id;
  late final String categorie;
  late final String menu;
  late final String partenaires;
  late final String themes;
  late final String nbrLangues;
  late final String titre;
  late final String imageURL;
  late final String sousTitres;
  late final String fr;
  late final String? en;
  late final String? es;
  late final String? it;
  late final String? de;
  late final String? pt;
  late final String? ru;
  late final String? ar;
  late final String? zh;
  late final String? ja;

  String? getUrlLang(String key) => toJson()[key];

  // Category({
  //   required this.categorie,
  //   required this.id,
  //   required this.menu,
  //   required this.partenaires,
  //   required this.themes,
  //   required this.nbrLangues,
  //   required this.titre,
  //   required this.imageURL,
  //   required this.sousTitres,
  //   required this.fr,
  //   required this.en,
  //   required this.es,
  //   required this.it,
  //   required this.de,
  //   required this.pt,
  //   required this.ru,
  //   required this.ar,
  //   required this.zh,
  //   required this.ja,
  // });

  Map<String, String?> toJson() {
    return <String, String?>{
      'categorie': categorie,
      'menu': menu,
      'partenaires': partenaires,
      'themes': themes,
      'nbrLangues': nbrLangues,
      'Titres': titre,
      'imageURL': imageURL,
      'sousTitres': sousTitres,
      'fr': fr,
      'en': en,
      'es': es,
      'it': it,
      'de': de,
      'pt': pt,
      'ru': ru,
      'ar': ar,
      'zh': zh,
      'ja': ja
    };
  }
}
