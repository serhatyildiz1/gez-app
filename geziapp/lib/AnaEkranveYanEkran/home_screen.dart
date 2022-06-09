import 'package:flutter/material.dart';
import 'package:geziapp/AnaEkranveYanEkran/drawer_navigation.dart';
import 'package:geziapp/AnaEkranveYanEkran/icerikdetay.dart';
import 'package:geziapp/models/icerikdeneme.dart';
import 'package:geziapp/models/kullanici.dart';
import 'package:geziapp/utils/database_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.kullanici}) : super(key: key);
  final Kullanici kullanici;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  final _databaseHelper = DatabaseHelper();

  final _icerikList = List<IcerikDeneme>.empty(growable: true);

  @override
  initState() {
    super.initState();
    getAllIcerik();
  }

  getAllIcerik() async {
    var icerikler = await _databaseHelper.icerikGetir();

    icerikler.forEach((icerik) {
      setState(() {
        var model = IcerikDeneme();
        model.icerikID = icerik['icerikID'];
        model.kategoriAd = icerik['kategoriAd'];
        model.DegerlendirmeID = icerik['DegerlendirmeID'];
        model.icerikFotograf = icerik['icerikFotograf'];
        model.icerikBilgi = icerik['icerikBilgi'];
        model.icerikUcret = icerik['icerikUcret'];
        model.icerikSaat = icerik['icerikSaat'];
        model.icerikBaslik = icerik['icerikBaslik'];

        _icerikList.add(model);
      });
    });
  }

  //islemler

  //islemler

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icerikler'),
      ),
      drawer: DrawerNavigation(
        kullanici: widget.kullanici,
      ),
      body: ListView.builder(
          itemCount: _icerikList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  child: ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IcerikDetay(
                                  baslik: _icerikList[index].icerikBaslik,
                                ))),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(_icerikList[index].icerikBaslik ??
                            'Baslik Bilgisi Yok')
                      ],
                    ),
                    subtitle: Text(
                        _icerikList[index].icerikUcret ?? 'Fiyat Bilgisi Yok'),
                    trailing: Text(
                        _icerikList[index].icerikSaat ?? 'Saat Bilgisi Yok'),
                  )),
            );
          }),
    );
  }
}
