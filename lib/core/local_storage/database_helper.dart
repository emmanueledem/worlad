import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/weather/data/model/local_weather_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._();

  DatabaseHelper._();

  late Database db;

  Future<void> initDB() async {
    String path = await getDatabasesPath();

    db = await openDatabase(
      join(path, 'worlad.db'),
      onCreate: (database, version) async {
        const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
        const textType = 'TEXT NOT NULL';
        const intType = 'INT NOT NULL';
        await database.execute(
          """
           CREATE TABLE $tableWeather (
       ${WeatherFields.id} $idType,
       ${WeatherFields.locationName} $textType,
       ${WeatherFields.temperature} $intType,
       ${WeatherFields.description} $textType,
       ${WeatherFields.time} $textType,
       ${WeatherFields.weatherId} $intType)
          """,
        );
        
      //   await database.execute(
      //     """
      //      CREATE TABLE $tableCountries (
      //  ${CountryFields.id} $idType,
      //  ${CountryFields.image} $textType,
      //  ${CountryFields.countryName} $textType,
      //  ${CountryFields.abbreviation} $textType,)
      //     """,
      //   );
      },
      // CREATE TABLE users (
      //         id INTEGER PRIMARY KEY AUTOINCREMENT,
      //         name TEXT NOT NULL,
      //         age INTEGER NOT NULL,
      //         email TEXT NOT NULL
      //       )
      version: 1,
    );
  }

  factory DatabaseHelper() {
    return _databaseHelper;
  }
  
}
