// ignore: depend_on_referenced_packages
import 'package:sqflite_common/sqlite_api.dart';

abstract class BaseTableService<T> {
  final Database db;
  final String name;

  BaseTableService(
    this.db,
    this.name,
  );

  /// deletes records by id
  Future<int> deleteOneById(int id) async {
    return db.delete(
      name,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// clear the table
  Future<void> clear() => db.delete(name);

  Future<List<T>> findManyFromDb([String keyword = '']);
}
