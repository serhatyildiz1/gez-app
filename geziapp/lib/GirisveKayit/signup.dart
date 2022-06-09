// ignore_for_file: must_be_immutable, non_constant_identifier_names, duplicate_ignore, unnecessary_const, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:geziapp/models/kullanici.dart';
import 'package:geziapp/utils/database_helper.dart';

class SignUp extends StatelessWidget {
  String? yeniKullaniciEmail;
  String? yeniKullaniciAd;
  String? yeniKullaniciSifre;
  DatabaseHelper databaseHelper = DatabaseHelper();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var FormKey = GlobalKey<FormState>();
    var FormKey2 = GlobalKey<FormState>();
    // ignore: non_constant_identifier_names
    var FormKey3 = GlobalKey<FormState>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sign Up Page"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: 80,
                    height: 150,
                    child: Image.asset('assets/images/signup.png')),
              ),
            ),

            //kullaniciEposta
            Form(
              key: FormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  onSaved: (yeniDegerEmail) {
                    yeniKullaniciEmail = yeniDegerEmail;
                  },
                  decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                ),
              ),
            ),

            ////kullaniciadi
            Form(
              key: FormKey2,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  onSaved: (yeniDegerAd) {
                    yeniKullaniciAd = yeniDegerAd;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Enter your username'),
                ),
              ),
            ),

            //sifre
            Form(
              key: FormKey3,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  onSaved: (yeniDegerSifre) {
                    yeniKullaniciSifre = yeniDegerSifre;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  FormKey.currentState?.save();
                  FormKey2.currentState?.save();
                  FormKey3.currentState?.save();

                  databaseHelper
                      .kullaniciKayit(Kullanici(yeniKullaniciEmail,
                          yeniKullaniciSifre, yeniKullaniciAd))
                      .then((kullaniciID) {
                    if (kullaniciID! > 0) {
                      debugPrint("Kullanici Eklendi: $kullaniciID");
                      _scaffoldKey.currentState?.showSnackBar(
                        const SnackBar(
                          content: Text("Kullanci Kaydi Olusturuldu..."),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  });
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
