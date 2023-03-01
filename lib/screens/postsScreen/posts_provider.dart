import 'package:flutter/cupertino.dart';
import 'package:project/api/api_service.dart';
import 'package:project/models/post_model.dart';
import 'package:project/models/user_model.dart';

class PostProvider extends ChangeNotifier {
  List<Post>? posts;
  Future<List<Post>> fetchPostsData() async {
    notifyListeners();
    return posts = await ApiService.fetchPosts();
  }
}
