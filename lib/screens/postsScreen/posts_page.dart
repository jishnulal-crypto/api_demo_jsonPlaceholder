import 'package:flutter/material.dart';
import 'package:project/models/post_model.dart';
import 'package:project/screens/postsscreen/posts_provider.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Post>>(
      future: Provider.of<PostProvider>(context).fetchPostsData(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Post post = snapshot.data![index];
                return UiWidget(post: post);
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    ));
  }
}

class UiWidget extends StatelessWidget {
  UiWidget({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: ListTile(
        leading: Text(post.id.toString()),
        title: Text(post.body.toString()),
        subtitle: Text(post.userId.toString()),
        trailing: Text(post.title.toString()),
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  ErrorWidget({required this.object, super.key});

  final Object object;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (() {}),
      child: Text(object.toString()),
    );
  }
}
