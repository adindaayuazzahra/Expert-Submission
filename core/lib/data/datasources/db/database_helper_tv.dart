import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:core/core.dart';

class DatabaseHelperTv {
  static DatabaseHelperTv? _databaseHelperTv;
  DatabaseHelperTv._instance() {
    _databaseHelperTv = this;
  }

  factory DatabaseHelperTv() =>
      _databaseHelperTv ?? DatabaseHelperTv._instance();

  static Database? _databaseTv;

  Future<Database?> get databaseTv async {
    _databaseTv ??= await _initDb();
    return _databaseTv;
  }

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditontonTV.db';

    var db = await openDatabase(databasePath, version: 2, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  watchlist_tv (
        id INTEGER PRIMARY KEY,
        name TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');
  }

  Future<int> insertTVWatchlist(TVTable tv) async {
    final db = await databaseTv;
    return await db!.insert('watchlist_tv', tv.toJson());
  }

  Future<int> removeWatchlistTv(TVTable tv) async {
    final db = await databaseTv;
    return await db!.delete(
      'watchlist_tv',
      where: 'id = ?',
      whereArgs: [tv.id],
    );
  }

  Future<Map<String, dynamic>?> getTVShowById(int id) async {
    final db = await databaseTv;
    final results = await db!.query(
      'watchlist_tv',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlistTVShow() async {
    final db = await databaseTv;
    final List<Map<String, dynamic>> results = await db!.query('watchlist_tv');

    return results;
  }
}
