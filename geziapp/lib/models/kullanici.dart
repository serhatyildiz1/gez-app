// ignore_for_file: unnecessary_this, non_constant_identifier_names

class Kullanici {
  int? kullaniciID;
  String? kullaniciEposta;
  String? kullaniciSifre;
  String? kullaniciAd;
  String? kullaniciOturum;

  Kullanici.Giris(this.kullaniciEposta, this.kullaniciSifre);
  Kullanici(this.kullaniciEposta, this.kullaniciSifre, this.kullaniciAd);

  Kullanici.withID(this.kullaniciID, this.kullaniciEposta, this.kullaniciSifre,
      this.kullaniciAd, this.kullaniciOturum);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['kullaniciID'] = kullaniciID;
    map['kullaniciEposta'] = kullaniciEposta;
    map['kullaniciSifre'] = kullaniciSifre;
    map['kullaniciAd'] = kullaniciAd;
    return map;
  }

  Kullanici.fromMap(Map<String, dynamic> map) {
    this.kullaniciID = map['kullaniciID'];
    this.kullaniciEposta = map['kullaniciEposta'];
    this.kullaniciSifre = map['kullaniciSifre'];
    this.kullaniciAd = map['kullaniciAd'];
  }
}
