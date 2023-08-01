import 'dart:developer';

import 'package:aamar_task/app/models/post.dart';
import 'package:aamar_task/app/service/offline/databse/database_services.dart';
import 'package:sqflite/sqflite.dart';

class FavoritePostsService extends BaseTableService<PostModel> {
  FavoritePostsService(Database db) : super(db, PostModel.tableName);

  Future<void> addPost({
    required PostModel post,
  }) async {
    await db.insert(
      name,
      post.toMap(),
    );

    log('Added New $name');
  }

  @override
  Future<List<PostModel>> findManyFromDb([String keyword = '']) async {
    final res = await db.query(name);
    return res.map((e) => PostModel.fromJson(e)).toList();
  }
}
