// ignore_for_file: unnecessary_this, duplicate_ignore

class Degerlendirme {
  int? degerlendirmeID;
  int? icerikID;
  int? kullaniciID;
  String? yorum;
  int? puan;

  Degerlendirme(this.kullaniciID, this.icerikID, this.yorum, this.puan);
  Degerlendirme.withID(this.degerlendirmeID, this.kullaniciID, this.icerikID,
      this.yorum, this.puan);

  Map<String, dynamic> toMap() {
    // ignore: prefer_collection_literals
    var map = Map<String, dynamic>();
    map['icerikID'] = icerikID;
    map['kullaniciID'] = kullaniciID;
    map['degerlendirmeID'] = degerlendirmeID;
    map['yorum'] = yorum;
    map['puan'] = puan;
    return map;
  }

  Degerlendirme.fromMap(Map<String, dynamic> map) {
    this.icerikID = map['icerikID'];
    // ignore: unnecessary_this
    this.kullaniciID = map['kullaniciID'];
    this.degerlendirmeID = map['degerlendirmeID'];
    this.yorum = map['yorum'];
    // ignore: unnecessary_this
    this.puan = map['puan'];
  }
}
