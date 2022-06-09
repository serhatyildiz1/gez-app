import 'package:flutter/material.dart';
import 'package:geziapp/AnaEkranveYanEkran/home_screen.dart';
import 'package:geziapp/AnaEkranveYanEkran/kategoriyegoreicerik.dart';
import 'package:geziapp/GirisveKayit/login.dart';
import 'package:geziapp/models/kullanici.dart';
import 'package:geziapp/utils/database_helper.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key, required this.kullanici}) : super(key: key);
  final Kullanici kullanici;
  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  final _categoryList = List<Widget>.empty(growable: true);
  final _databaseHelper = DatabaseHelper();
  @override
  initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    var categories = await _databaseHelper.kategoriGetir();

    categories?.forEach((category) {
      setState(() {
        _categoryList.add(InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => KategoriyeIcerik(
                category: category['kategoriAd'],
              ),
            ),
          ),
          child: ListTile(
            title: Text(category['kategoriAd']),
          ),
        ));
      });
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png'),
            ),
            accountName: Text(widget.kullanici.kullaniciAd!),
            accountEmail: Text(widget.kullanici.kullaniciEposta!),
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomeScreen(
                      kullanici: widget.kullanici,
                    ))),
          ),
          const ListTile(
            leading: Icon(Icons.view_list),
            title: Text('Categories'),
          ),
          Column(
            children: _categoryList,
          ),
          ButtonTheme(
            minWidth: 5,
            height: 100,
            child: ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login())),
              child: const Text(
                'Çıkış Yap',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
