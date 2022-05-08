import 'package:flutter/material.dart';
import 'package:image_app/screens/second_screen/api/responses/post_response.dart';

class PostWidget extends StatelessWidget {
  final PostResponse post;
  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title,
          textAlign: TextAlign.start,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          SizedBox(
            height: 15,
          ),
          Text(post.body,
          textAlign: TextAlign.start,
          style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12),)
        ],
      ),
    );
  }
}
