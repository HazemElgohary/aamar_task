import 'package:aamar_task/app/models/post.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final PostModel post;
  final VoidCallback onTap;
  final bool favorite;
  final ValueChanged<PostModel> onFavorite;

  const PostItem({
    Key? key,
    required this.post,
    required this.onTap,
    this.favorite = false,
    required this.onFavorite,
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
        trailing: IconButton(
          onPressed: () {
            onFavorite(post);
          },
          icon: Icon(
            favorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
