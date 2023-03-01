import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/models/post_model.dart';
import 'package:project/models/user_model.dart';

class ApiService {
  static String baseUrl = "https://jsonplaceholder.typicode.com";

  static Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      List list_users = jsonDecode(response.body);
      List<User> users = list_users.map((user) => User.fromJson(user)).toList();
      return users;
    } else {
      throw Exception('unable to fetch users');
    }
  }

  static Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      List list_posts = jsonDecode(response.body);
      List<Post> posts = list_posts.map((post) => Post.fromJson(post)).toList();
      print(posts);
      return posts;
    } else {
      throw Exception('unable to fetch posts');
    }
  }
}
