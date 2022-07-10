import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  final String userTable = 'user_table';
  final String UserDb = 'user_database';

  Future<Database> init() async {
    String databasePath = await getDatabasesPath();

    // Database db = await openDatabase(databasePath);
    String path = join(databasePath, '$UserDb.db');
    print("PATH => $path");

// open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      print("DB CREATE QUERY");
      await db.execute(
          'CREATE TABLE $userTable (user_id INTEGER PRIMARY KEY AUTOINCREMENT, user_name TEXT, age INTEGER, email_id TEXT)');
    });

    return database;
  }

  // Future<void> closeDB({required Database database}) async {
  //   await database.close();
  // }

  // Future<bool> isDbOpen({required Database database}) async {
  //   return database.isOpen;
  // }

  // Future<List<Map<String, dynamic>>> getAllDataDb(
  //     {required Database databse, required String dbName}) async {
  //   List<Map<String, dynamic>> _list =
  //       await databse.rawQuery('SELECT * FROM $dbName');
  //   return _list;
  // }

//   Future<Database> getDB({required String dbName}) async {
//     if (_databse == null) {
//       _databse =  await openDB(dbName: dbName);
//     }
//     return _databse;
//   }

//   Future<Database> openDB(
//       {required String dbName}) async {
//     String databasePath = await getDatabasesPath();

//     Database db = await openDatabase(databasePath);

//     String path = join(databasePath, '$dbName.db');

// // open the database
//     Database database = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute('CREATE TABLE $dbName ($tableColumnQuery)');
//     });

//     return database;

//     return db;
//   }
}
