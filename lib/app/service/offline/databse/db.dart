import 'dart:developer';

import 'package:aamar_task/app/models/post.dart';
import 'package:get/get.dart';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseServices {
  static Future<String> getDbPath() async {
    if (Platform.isWindows) {
      // Init ffi loader if needed.
      sqfliteFfiInit();
      return join(
        // will store the database inside the project directory
        Directory.current.path,
        // database file name
        'Aamar.db',
      );
    } else {
      final dbPath = await getDatabasesPath();
      return join(
        // will store the database inside the project directory
        dbPath,
        // database file name
        'Aamar.db',
      );
    }
  }

  // Create the database
  static Future<Database> boot() async {
    // await checkIfDatabaseFound();
    return Platform.isWindows
        ? databaseFactoryFfi.openDatabase(
            await getDbPath(),
            options: OpenDatabaseOptions(
              onCreate: onCreate,
              onOpen: onOpen,
              version: 1,
            ),
          )

        /// * opens the database for [Android] and [iOS]
        : openDatabase(
            await getDbPath(),
            onCreate: onCreate,
            onOpen: onOpen,
            version: 1,
          );
  }

  static Future<void> onOpen(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  static Future<void> onCreate(Database db, int version) async {
    await db.execute(PostModel.createStatement);
    log('all tables has been created 👍');
  }

  Future<void> clearOne(String tableName) async {
    final db = Get.find<Database>();
    await db.transaction(
      (txn) async {
        await txn.execute("DELETE FROM $tableName");
        return txn;
      },
    );
  }

  Future<void> clear() async {
    final db = Get.find<Database>();
    final tables = <String>[
      PostModel.tableName,
    ];
    await db.transaction(
      (txn) async {
        for (final table in tables) {
          await txn.execute("DELETE FROM $table");
        }
        log('database cleared ✔');
        return txn;
      },
    );
  }

  Future<void> clearAll() async {
    final db = Get.find<Database>();
    final tables = <String>[];
    await db.transaction(
      (txn) async {
        for (final table in tables) {
          await txn.execute("DELETE FROM $table");
        }
        log('database cleared ✔');
        return txn;
      },
    );
  }

  // static Future<void> checkIfDatabaseFound()async{
  //   final data = File(await getDbPath());
  //   if(await data.exists() && !Prefs.getBool(PrefsKeys.firstLogin)){
  //     data.delete();
  //   }
  // }
}
