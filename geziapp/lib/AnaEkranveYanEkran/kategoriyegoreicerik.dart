import 'package:flutter/material.dart';
import 'package:geziapp/AnaEkranveYanEkran/icerikdetay.dart';
import 'package:geziapp/models/icerikdeneme.dart';
import 'package:geziapp/utils/database_helper.dart';

class KategoriyeIcerik extends StatefulWidget {
  final String? category;

  const KategoriyeIcerik({Key? key, this.category}) : super(key: key);

  @override
  State<KategoriyeIcerik> createState() => _KategoriyeIcerikState();
}

class _KategoriyeIcerikState extends State<KategoriyeIcerik> {
  final _icerikListesi = List<IcerikDeneme>.empty(growable: true);
  final _databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    kategoriyeIcerikAl();
  }

  void kategoriyeIcerikAl() async {
    var icerikler = await _databaseHelper.readIcerikByCategory(widget.category);
    icerikler.forEach((icerik) {
      setState(() {
        var model = IcerikDeneme();
        model.icerikBaslik = icerik['icerikBaslik'];
        model.icerikUcret = icerik['icerikUcret'];
        model.icerikSaat = icerik['icerikSaat'];

        _icerikListesi.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category!)),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _icerikListesi.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0),
                      child: Card(
                        elevation: 8,
                        child: ListTile(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => IcerikDetay(
                                baslik: _icerikListesi[index].icerikBaslik,
                              ),
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(_icerikListesi[index].icerikBaslik!)
                            ],
                          ),
                          subtitle:
                              Text(_icerikListesi[index].icerikUcret! + ' TL'),
                          trailing: Text(
                              'Acik: ' + _icerikListesi[index].icerikSaat!),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
