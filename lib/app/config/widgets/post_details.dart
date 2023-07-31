import 'package:aamar_task/app/models/post.dart';
import 'package:flutter/material.dart';

class PostDetailsItem extends StatelessWidget {
  final PostModel post;
  const PostDetailsItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'title : ',
            ),
            Expanded(
              child: Text(
                post.title,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'body : ',
                  ),
                  Expanded(
                    child: Text(
                      post.body,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    'user Id : ',
                  ),
                  Text(
                    post.userId.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),


              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text(
                    'Id : ',
                  ),
                  Text(
                    post.id.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ].reversed.toList(),
          ),
        ),
      ),
    );
  }
}
