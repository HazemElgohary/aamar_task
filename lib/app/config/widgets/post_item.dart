import 'package:aamar_task/app/models/post.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final PostModel post;
  final VoidCallback onTap;

  const PostItem({
    Key? key,
    required this.post,
    required this.onTap,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(
          post.title,
        ),
        subtitle: Text(
          post.body.substring(0, 100),
        ),
      ),
    );
  }
}
