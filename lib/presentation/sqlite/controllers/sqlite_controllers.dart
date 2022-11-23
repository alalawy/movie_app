import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_app/data/home/models/popular_movies_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class SqliteController extends GetxController {
  Database? database;
  var movies = <Result>[].obs;
  final box = GetStorage();

  void openDb() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'favorites.db');
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Favorites (id INTEGER PRIMARY KEY, idUser TEXT, idMovie INTEGER, title TEXT, backdropPath TEXT, releaseDate TEXT, overview TEXT)');
    });
  }

  Future<void> addOrRemoveFavorite(txn, int idMovies, Result data) async {
    List<Map> list = await database!.rawQuery(
        'SELECT id FROM Favorites WHERE idUser = ? AND idMovie = ?',
        [box.read('user'), idMovies]);
    if (list.isEmpty) {
      int id1 = await txn.rawInsert(
          'INSERT INTO Favorites (idUser, idMovie, title, backdropPath, releaseDate, overview) VALUES("${box.read('user')}", ${data.id}, "${data.title}", "${data.backdropPath}","${data.releaseDate.toString()}", "${data.overview}")');
    } else {
      var mov = await database!.rawDelete(
          'DELETE FROM Favorites WHERE idUser = ? AND idMovie = ?',
          [box.read('user'), idMovies]);
    }
  }

  Future<void> getFavoritesList() async {
    movies.clear();
    List<Map<String, dynamic>> list = await database!.rawQuery(
        'SELECT * FROM Favorites WHERE idUser = ?', [box.read('user')]);
    for (var element in list) {
      print(element);
      movies().add(Result(
        id: element['idMovie'],
        title: element['title'],
        backdropPath: element['backdropPath'],
        releaseDate: DateTime.parse(element['releaseDate']),
        overview: element['overview'],
      ));
    }
  }

  Future<bool> checkIsFavorites(int idMovie) async {
    List<Map<String, dynamic>> list = await database!.rawQuery(
        'SELECT * FROM Favorites WHERE idUser = ? AND idMovie = ?',
        [box.read('user'), idMovie]);
    return list.isNotEmpty ? true : false;
  }

  Future<String> getPhotoandConvertToBase64(photo) async {
    final bytes = File(photo).readAsBytesSync();
    String img64 = base64Encode(bytes);
    return img64;
  }
}
