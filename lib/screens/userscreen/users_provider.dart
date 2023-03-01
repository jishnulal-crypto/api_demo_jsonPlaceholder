import 'package:flutter/cupertino.dart';
import 'package:project/api/api_service.dart';
import 'package:project/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  List<User>? users;
  Future<List<User>> fetchUsersData() async {
    notifyListeners();
    return users = await ApiService.fetchUsers();
  }
}
