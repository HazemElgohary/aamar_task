import 'package:aamar_task/app/config/widgets/post_item.dart';
import 'package:aamar_task/app/config/widgets/search_bar_item.dart';
import 'package:aamar_task/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomSearchBar(
              controller: controller.searchController,
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.loading.value
                  ? SkeletonListView(
                      itemCount: 10,
                    )
                  : controller.error.value.isNotEmpty
                      ? Center(
                          child: Text(
                            controller.error.value,
                          ),
                        )
                      : controller.viewedPosts.isEmpty
                          ? const Center(
                              child: Text(
                                'empty',
                              ),
                            )
                          :  RefreshIndicator(
                                  onRefresh: controller.getAll,
                                  child: ListView.builder(
                                    itemCount: controller.viewedPosts.length,
                                    itemBuilder: (context, index) => PostItem(
                                      post: controller.viewedPosts[index],
                                      onTap: () => Get.toNamed(
                                        Routes.POST_DETAILS,
                                        arguments: controller.viewedPosts[index],
                                      ),
                                    ),
                                  ),
                                ),
            ),
          ),
        ],
      ),
    );
  }
}
