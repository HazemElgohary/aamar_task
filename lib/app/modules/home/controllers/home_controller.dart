import 'dart:developer';

import 'package:aamar_task/app/models/post.dart';
import 'package:aamar_task/app/service/posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final service = Get.find<PostService>();
  final searchController = TextEditingController();

  final allposts = <PostModel>[].obs;
  final viewedPosts = <PostModel>[].obs;

  final loading = false.obs;
  final error = ''.obs;
  final page = 1.obs;

  Future<void> getAll() async {
    try {
      error.value = '';
      loading.value = true;

      allposts.assignAll(
        await service.getPosts(),
      );
      viewedPosts.assignAll(allposts);
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

  @override
  void onInit() {
    getAll();
    super.onInit();
  }

  @override
  void onReady() {
    searchController.addListener(
          () {

            viewedPosts.assignAll(
          allposts.where((p0) => p0.title.toLowerCase().contains(searchController.text.toLowerCase()))
              .toList());
            log(viewedPosts.length.toString());
      },
    );
    super.onReady();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
