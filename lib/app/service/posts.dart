import 'dart:io';

import 'package:aamar_task/app/helpers/end_points.dart';
import 'package:aamar_task/app/models/post.dart';
import 'package:dio/dio.dart';

class PostService {
  final Dio dio;

  PostService(this.dio);

  Future<List<PostModel>> getPosts({
  int page = 1,
  int limit = 10,
}) async {
    final res = await dio.get(
      EndPoints.posts,
      queryParameters: {
        'page': page,
        'limit': limit,
      }
    );
    if (res.statusCode != HttpStatus.ok) {
      throw res.data['message'] ?? res.data;
    }

    return (res.data as List)
        .map(
          (e) => PostModel.fromJson(e),
        )
        .toList();
  }
}
