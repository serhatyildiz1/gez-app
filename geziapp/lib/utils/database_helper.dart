// ignore_for_file: avoid_print, prefer_is_empty

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:geziapp/models/kullanici.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  /*static DatabaseHelper? _databaseHelper;
  static Database? _database;

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    } else {
      return _databaseHelper;
    }
  }
  DatabaseHelper._internal();
  */
  static final DatabaseHelper _databaseHelper = DatabaseHelper._internal();
  static Database? _database;
  factory DatabaseHelper() {
    return _databaseHelper;
  }
  DatabaseHelper._internal();
  //ssss
  Future<Database?> _getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  Future<Database> _initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "gezi.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "gezi.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
// open the database
    return await openDatabase(path, readOnly: false);
  }

  Future<List<Map<String, Object?>>?> kullanicilariGetir() async {
    var db = await _getDatabase();
    var sonuc = await db?.query("kullanici");
    return sonuc;
  }

  //kullanicikayit
  Future<int?> kullaniciKayit(Kullanici kullanici) async {
    var db = await _getDatabase();
    var sonuc = await db?.insert("kullanici", kullanici.toMap());
    return sonuc;
  }

  //kullanici giris
  Future<Kullanici?> getLogin(
      String kullaniciEposta, String kullaniciSifre) async {
    var db = await _getDatabase();
    var sonuc = await db?.rawQuery("SELECT * FROM kullanici WHERE "
        "kullaniciEposta = '$kullaniciEposta' AND "
        "kullaniciSifre = '$kullaniciSifre'");

    if (sonuc!.length > 0) {
      return Kullanici.fromMap(sonuc.first);
    }
    return null;
  }

  //Kategorileri Okuma
  kategoriGetir() async {
    var db = await _getDatabase();
    var sonuc = await db?.query("kategori");
    return sonuc;
  }

  //Kullanicilari Okuma
  kullaniciGetir() async {
    var db = await _getDatabase();
    var sonuc = await db?.query("kullanici");
    return sonuc;
  }

  //icerik okuma
  icerikGetir() async {
    var db = await _getDatabase();
    var sonuc = await db?.query("icerik");
    return sonuc;
  }

  //Columna gore isim okuma
  readDataByColumnName(table, columnName, columnValue) async {
    var db = await _getDatabase();
    return await db
        ?.query(table, where: '$columnName=?', whereArgs: [columnValue]);
  }

  //kategoriye gore icerik oku
  readIcerikByCategory(category) async {
    return await readDataByColumnName('icerik', 'kategoriAd', category);
  }

  readIcerikDetayBuIcerik(icerikbaslik) async {
    return await readDataByColumnName('icerik', 'icerikBaslik', icerikbaslik);
  }

/*   //Kullanici Giris Kontrol
  Future<int?> updateUser(Kullanici kullanici) async {
    var db = await _getDatabase();
    var sonuc = await db?.update("kullanici", kullanici.toMap(),
        where: 'kullaniciID=?', whereArgs: [kullanici.kullaniciID]);
    return sonuc;
  } */
}
