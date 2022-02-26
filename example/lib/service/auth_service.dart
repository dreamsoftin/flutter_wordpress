import 'package:flutter_wordpress/schemas/user.dart';
import 'package:flutter_wordpress_example/service/wordpress_service.dart';

class AuthService {
  static AuthService instance = AuthService._();
  AuthService._() {
    try {
      fetchMe();
    } catch (e) {}
  }

  User? currentUser;

  Future<void> fetchMe() async {
    currentUser = await WordPressService.instane.wordPress.user.fetchMe();
  }

  Future<void> authenticate(String username,String password) async {
      await WordPressService.instane.wordPress.authenticateUser(username: username, password: password);
      await fetchMe();
  }
}
