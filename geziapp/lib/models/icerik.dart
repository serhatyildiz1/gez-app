// ignore_for_file: unnecessary_this

class Icerik {
  int? icerikID;
  int? kategoriID;
  // ignore: non_constant_identifier_names
  int? DegerlendirmeID;
  String? icerikFotograf;
  String? icerikBilgi;
  String? icerikUcret;
  String? icerikSaat;
  String? icerikBaslik;

  Icerik(this.kategoriID, this.DegerlendirmeID, this.icerikFotograf,
      this.icerikBilgi, this.icerikSaat, this.icerikUcret, this.icerikBaslik);
  Icerik.withID(
      this.icerikID,
      this.kategoriID,
      this.DegerlendirmeID,
      this.icerikFotograf,
      this.icerikBilgi,
      this.icerikSaat,
      this.icerikUcret,
      this.icerikBaslik);
  Map<String, dynamic> toMap() {
    // ignore: prefer_collection_literals
    var map = Map<String, dynamic>();
    map['icerikID'] = icerikID;
    map['kategoriID'] = kategoriID;
    map['DegerlendirmeID'] = DegerlendirmeID;
    map['icerikFotograf'] = icerikFotograf;
    map['icerikBilgi'] = icerikBilgi;
    map['icerikUcret'] = icerikUcret;
    map['icerikSaat'] = icerikSaat;
    map['icerikBaslik'] = icerikBaslik;
    return map;
  }

  Icerik.fromMap(Map<String, dynamic> map) {
    this.icerikID = map['icerikID'];
    this.kategoriID = map['kategoriID'];
    this.DegerlendirmeID = map['DegerlendirmeID'];
    this.icerikFotograf = map['icerikFotograf'];
    this.icerikUcret = map['icerikUcret'];
    this.icerikSaat = map['icerikSaat'];
    this.icerikBaslik = map['icerikBaslik'];
  }
}
