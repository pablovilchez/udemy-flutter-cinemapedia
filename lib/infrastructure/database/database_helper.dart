import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._internal();

  static DatabaseHelper get instance {
    _databaseHelper ??= DatabaseHelper._internal();
    return _databaseHelper!;
  }

  Database? _db;
  Database? get db => _db;

  Future<void> init() async {
    _db = await openDatabase(
      'favorites.db',
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE movies(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            movieId INTEGER,
            title TEXT,
            posterPath TEXT,
            backdropPath TEXT,
            overview TEXT,
            releaseDate TEXT,
            voteAverage REAL
          )
        ''');
      },
    );
  }
}