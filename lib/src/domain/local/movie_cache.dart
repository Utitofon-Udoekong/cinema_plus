import 'dart:convert';

import 'package:cinema_plus/src/constants/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'package:cinema_plus/src/models/models.dart' show Movie, Cast, Actor;

class MovieCache {
  Database? _database;
  static const String _lastFetchKey = 'last_fetch_';
  static const Duration _cacheDuration = Duration(days: 2);

  @factoryMethod
  static Future<MovieCache> create() async {
    final instance = MovieCache();
    await instance._initDatabase();
    return instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String dbPath = path.join(await getDatabasesPath(), 'movie_cache.db');
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE movies(
            id INTEGER PRIMARY KEY,
            adult INTEGER NOT NULL,
            backdrop_path TEXT,
            genre_ids TEXT NOT NULL,
            original_language TEXT NOT NULL,
            original_title TEXT NOT NULL,
            overview TEXT NOT NULL,
            popularity REAL NOT NULL,
            poster_path TEXT,
            release_date TEXT NOT NULL,
            title TEXT NOT NULL,
            video INTEGER NOT NULL,
            vote_average REAL NOT NULL,
            vote_count INTEGER NOT NULL,
            list_type TEXT NOT NULL,
            page INTEGER NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE page_info(
            list_type TEXT PRIMARY KEY,
            current_page INTEGER NOT NULL,
            total_pages INTEGER NOT NULL,
            total_results INTEGER NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE cast(
            id INTEGER PRIMARY KEY,
            movie_id INTEGER NOT NULL,
            adult INTEGER NOT NULL,
            gender INTEGER,
            known_for_department TEXT,
            name TEXT NOT NULL,
            original_name TEXT NOT NULL,
            popularity REAL,
            profile_path TEXT,
            cast_id INTEGER,
            character TEXT,
            credit_id TEXT,
            FOREIGN KEY (movie_id) REFERENCES movies(id)
          )
        ''');
        await db.execute('''
          CREATE TABLE actors(
            id INTEGER PRIMARY KEY,
            adult INTEGER NOT NULL,
            also_known_as TEXT,
            biography TEXT,
            birthday TEXT,
            deathday TEXT,
            gender INTEGER,
            homepage TEXT,
            imdb_id TEXT,
            known_for_department TEXT,
            name TEXT NOT NULL,
            place_of_birth TEXT,
            popularity REAL,
            profile_path TEXT,
            movie_credits TEXT,
            images TEXT
          )
        ''');
      },
    );
  }

  Future<bool> shouldFetchFromServer(MovieListType listType) async {
    final prefs = await SharedPreferences.getInstance();
    final lastFetch = prefs.getInt('$_lastFetchKey${listType.toString()}') ?? 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    return now - lastFetch > _cacheDuration.inMilliseconds;
  }

  Future<void> updateLastFetchTime(MovieListType listType) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('$_lastFetchKey${listType.toString()}', DateTime.now().millisecondsSinceEpoch);
  }

  Future<void> cacheMovies(List<Movie> movies, MovieListType listType, int page, int totalPages, int totalResults) async {
    final db = await database;
    await db.transaction((txn) async {
      for (var movie in movies) {
        await txn.insert(
          'movies',
          {
            ...movie.toJson(),
            'adult': movie.adult ? 1 : 0,
            'video': movie.video ? 1 : 0,
            'genre_ids': json.encode(movie.genreIds),
            'list_type': listType.toString(),
            'page': page,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await txn.insert(
        'page_info',
        {
          'list_type': listType.toString(),
          'current_page': page,
          'total_pages': totalPages,
          'total_results': totalResults,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<List<Movie>> getCachedMovies(MovieListType listType, {int? page}) async {
    final db = await database;
    List<Map<String, dynamic>> maps;
    if (page != null) {
      maps = await db.query(
        'movies',
        where: 'list_type = ? AND page = ?',
        whereArgs: [listType.toString(), page],
      );
    } else {
      maps = await db.query(
        'movies',
        where: 'list_type = ?',
        whereArgs: [listType.toString()],
        orderBy: 'page ASC',
      );
    }
    return List.generate(maps.length, (i) {
      Map<String, dynamic> movieMap = Map<String, dynamic>.from(maps[i]);
      // var movieMap = maps[i];
      movieMap['adult'] = movieMap['adult'] == 1;
      movieMap['video'] = movieMap['video'] == 1;
      movieMap['genre_ids'] = json.decode(movieMap['genre_ids']);
      return Movie.fromJson(movieMap);
    });
  }

  Future<Movie?> getMovieFromCache(int movieId) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'movies',
      where: 'id = ?',
      whereArgs: [movieId],
      limit: 1,
    );
    if (result.isNotEmpty) {
      Map<String, dynamic> movieMap = Map<String, dynamic>.from(result.first);
      movieMap['adult'] = movieMap['adult'] == 1;
      movieMap['video'] = movieMap['video'] == 1;
      movieMap['genre_ids'] = json.decode(movieMap['genre_ids']);
      return Movie.fromJson(movieMap);
    }
    return null;
  }

  Future<void> cacheCast(int movieId, List<Cast> cast) async {
    final db = await database;
    await db.transaction((txn) async {
      for (var member in cast) {
        await txn.insert(
          'cast',
          {
            ...member.toJson(),
            'movie_id': movieId,
            'adult': member.adult ? 1 : 0,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  Future<List<Cast>> getCachedCast(int movieId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'cast',
      where: 'movie_id = ?',
      whereArgs: [movieId],
    );
    return List.generate(maps.length, (i) {
      Map<String, dynamic> castMap = Map<String, dynamic>.from(maps[i]);
      castMap['adult'] = castMap['adult'] == 1;
      return Cast.fromJson(castMap);
    });
  }

  Future<void> cacheActor(Actor actor) async {
    final db = await database;
    await db.insert(
      'actors',
      {
        ...actor.toJson(),
        'adult': actor.adult ? 1 : 0,
        'also_known_as': json.encode(actor.alsoKnownAs),
        'movie_credits': json.encode(actor.movieCredits?.toJson()),
        'images': json.encode(actor.images?.toJson()),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Actor?> getCachedActor(int actorId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'actors',
      where: 'id = ?',
      whereArgs: [actorId],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      Map<String, dynamic> actorMap = Map<String, dynamic>.from(maps.first);
      actorMap['adult'] = actorMap['adult'] == 1;
      actorMap['also_known_as'] = json.decode(actorMap['also_known_as']);
      actorMap['movie_credits'] = json.decode(actorMap['movie_credits']);
      actorMap['images'] = json.decode(actorMap['images']);
      return Actor.fromJson(actorMap);
    }
    return null;
  }


  Future<Map<String, dynamic>> getPageInfo(MovieListType listType) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'page_info',
      where: 'list_type = ?',
      whereArgs: [listType.toString()],
    );
    if (result.isNotEmpty) {
      Map<String, dynamic> resultMap = Map<String, dynamic>.from(result.first);
      return {
        'currentPage': resultMap['current_page'] as int,
        'totalPages': resultMap['total_pages'] as int,
        'totalResults': resultMap['total_results'] as int,
      };
    }
    return {'currentPage': 0, 'totalPages': 1, 'totalResults': 0};
  }

  Future<void> clearCache({MovieListType? listType}) async {
    final db = await database;
    if (listType != null) {
      await db.delete('movies', where: 'list_type = ?', whereArgs: [listType.toString()]);
      await db.delete('page_info', where: 'list_type = ?', whereArgs: [listType.toString()]);
    } else {
      await db.delete('movies');
      await db.delete('page_info');
      await db.delete('cast');
      await db.delete('actors');
    }
  }
}
