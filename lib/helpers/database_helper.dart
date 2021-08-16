import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:towatch/models/towatch_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _db;
  DatabaseHelper._instance();

  String movieTables = 'movie_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDirector = 'director';
  String colImgUrl = 'imgUrl';
  String colStatus = 'status';

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'towatch.db';
    final toWatchDb = await openDatabase(path, version: 1, onCreate: _createDb);
    return toWatchDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $movieTables($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,$colDirector TEXT,$colImgUrl TEXT,$colStatus INTEGER)');
  }

  Future<List<Map<String, dynamic>>> getToWatchMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(movieTables);
    return result;
  }

  Future<List<ToWatch>> getToWatchList() async {
    final List<Map<String, dynamic>> toWatchMapList = await getToWatchMapList();
    final List<ToWatch> toWatchList = [];
    toWatchMapList.forEach((toWatchMap) {
      toWatchList.add(ToWatch.fromMap(toWatchMap));
    });
    return toWatchList;
  }

  Future<int> insertToWatch(ToWatch toWatch) async {
    Database db = await this.db;
    final int result = await db.insert(movieTables, toWatch.toMap());
    return result;
  }

  Future<int> updateToWatch(ToWatch toWatch) async {
    Database db = await this.db;
    final int result = await db.update(movieTables, toWatch.toMap(),
        where: '$colId = ?', whereArgs: [toWatch.id]);
    return result;
  }

  Future<int> deleteToWatch(int id) async {
    Database db = await this.db;
    final int result =
        await db.delete(movieTables, where: '$colId = ?', whereArgs: [id]);
    return result;
  }
}
