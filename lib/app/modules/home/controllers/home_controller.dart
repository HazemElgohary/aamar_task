import 'dart:developer';

import 'package:aamar_task/app/models/post.dart';
import 'package:aamar_task/app/service/offline/favorite_posts.dart';
import 'package:aamar_task/app/service/posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// controller for search
  final searchController = TextEditingController();
  /// online service get posts from Api
  final service = Get.find<PostService>();
  final allPosts = <PostModel>[].obs;
  final viewedPosts = <PostModel>[].obs;

  final loading = false.obs;
  final error = ''.obs;
  final page = 1.obs;
  Future<void> getAll() async {
    try {
      error.value = '';
      loading.value = true;

      allPosts.assignAll(
        await service.getPosts(),
      );
      viewedPosts.assignAll(allPosts);
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      error.value = e.toString();
      Get.snackbar(
        'error',
        e.toString(),
      );
    } finally {
      loading.value = false;
    }
  }


  /// offline service get favorite posts
  final offlineService = Get.find<FavoritePostsService>();
  final favoritePosts = <PostModel>[].obs;
  Future<void> getFavoritePosts() async {
    try {
      favoritePosts.assignAll(
        await offlineService.findManyFromDb(),
      );
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      error.value = e.toString();
      Get.snackbar(
        'error',
        e.toString(),
      );
    }
  }

  Future<void> toggleFavorite(PostModel post) async {
    await toggleFavoriteLocal(post);
    if (favoritePosts.contains(post)) {
      favoritePosts.remove(post);
    } else {
      favoritePosts.add(post);
    }
  }

  Future<void> toggleFavoriteLocal(PostModel post) async {
    if (favoritePosts.contains(post)) {
      await offlineService.deleteOneById(post.id);
    } else {
      await offlineService.addPost(post: post);
    }
  }

  @override
  void onInit() {
    getAll();
    getFavoritePosts();
    super.onInit();
  }

  @override
  void onReady() {
    /// Listen to any change in search and update ui
    searchController.addListener(
      () {
        viewedPosts.assignAll(allPosts
            .where((p0) => p0.title
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
            .toList());
        log(viewedPosts.length.toString());
      },
    );
    super.onReady();
  }

  @override
  void onClose() {
    /// close controller
    searchController.dispose();
    super.onClose();
  }
}
