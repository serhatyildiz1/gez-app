import 'package:flutter/material.dart';
import 'package:geziapp/models/icerikdeneme.dart';
import 'package:geziapp/utils/database_helper.dart';

class IcerikDetay extends StatefulWidget {
  final String? baslik;
  // ignore: use_key_in_widget_constructors
  const IcerikDetay({this.baslik});

  @override
  State<IcerikDetay> createState() => _IcerikDetayState();
}

class _IcerikDetayState extends State<IcerikDetay> {
  //islemler
  // ignore: non_constant_identifier_names
  final List<IcerikDeneme> _IcerikDetayListesi =
      List<IcerikDeneme>.empty(growable: true);
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    IcerikDetayAl();
  }

  // ignore: non_constant_identifier_names
  IcerikDetayAl() async {
    var icerikler =
        await _databaseHelper.readIcerikDetayBuIcerik(widget.baslik);
    icerikler.forEach((icerikdetay) {
      setState(() {
        var model = IcerikDeneme();
        model.icerikID = icerikdetay['icerikID'];
        model.kategoriAd = icerikdetay['kategoriAd'];
        model.DegerlendirmeID = icerikdetay['DegerlendirmeID'];
        model.icerikFotograf = icerikdetay['icerikFotograf'];
        model.icerikBilgi = icerikdetay['icerikBilgi'];
        model.icerikUcret = icerikdetay['icerikUcret'];
        model.icerikSaat = icerikdetay['icerikSaat'];
        model.icerikBaslik = icerikdetay['icerikBaslik'];

        _IcerikDetayListesi.add(model);
      });
    });
  }

  //islemler
  @override
  Widget build(BuildContext context) {
    String? tl = ' TL';
    return Scaffold(
        appBar: AppBar(title: Text(widget.baslik!)),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _IcerikDetayListesi.length,
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.arrow_drop_down_circle),
                          title: Text(_IcerikDetayListesi[index].icerikBaslik!),
                          subtitle: Text(
                            _IcerikDetayListesi[index].icerikSaat!,
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                          trailing: Text(
                              _IcerikDetayListesi[index].icerikUcret! + tl),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            _IcerikDetayListesi[index].icerikBilgi!,
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                        Image.asset("assets/images/" +
                            _IcerikDetayListesi[index]
                                .icerikFotograf
                                .toString()),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black, // Background color
                                onPrimary: Colors
                                    .amber, // Text Color (Foreground color)
                              ),
                              onPressed: () {
                                // Perform some action
                              },
                              child: const Text('ACTION 1'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black, // Background color
                                onPrimary: Colors
                                    .amber, // Text Color (Foreground color)
                              ),
                              onPressed: () {
                                // Perform some action
                              },
                              child: const Text('ACTION 2'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
