// ignore_for_file: prefer_collection_literals, unnecessary_this

class Kategori {
  int? kategoriID;
  String? kategoriAd;

  Kategori(this.kategoriAd);
  Kategori.withId(this.kategoriID, this.kategoriAd);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['kategoriID'] = kategoriID;
    map['kategoriAd'] = kategoriAd;
    return map;
  }

  Kategori.fromMap(Map<String, dynamic> map) {
    this.kategoriID = map['kategoriID'];
    this.kategoriAd = map['kategoriAd'];
  }
}
