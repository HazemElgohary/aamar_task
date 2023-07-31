import 'package:aamar_task/app/config/widgets/post_details.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/post_details_controller.dart';

class PostDetailsView extends GetView<PostDetailsController> {
  const PostDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PostDetailsItem(
            post: controller.post,
          ),
        ],
      ),
    );
  }
}
