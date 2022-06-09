// ignore_for_file: non_constant_identifier_names, prefer_collection_literals

class IcerikDeneme {
  int? icerikID;
  int? DegerlendirmeID;
  String? icerikFotograf;
  String? icerikBilgi;
  String? icerikUcret;
  String? icerikSaat;
  String? icerikBaslik;
  String? kategoriAd;
  icerikMap() {
    var mapping = Map<String, dynamic>();
    mapping['icerikID'] = icerikID;
    mapping['kategoriAd'] = kategoriAd;
    mapping['DegerlendirmeID'] = DegerlendirmeID;
    mapping['icerikFotograf'] = icerikFotograf;
    mapping['icerikBilgi'] = icerikBilgi;
    mapping['icerikUcret'] = icerikUcret;
    mapping['icerikSaat'] = icerikSaat;
    mapping['icerikBaslik'] = icerikBaslik;
    return mapping;
  }
}
