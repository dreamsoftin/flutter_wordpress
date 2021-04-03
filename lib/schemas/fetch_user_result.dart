import 'user.dart';

class FetchUsersResult {
  List<User> users = const [];
  int? totalUsers;

  FetchUsersResult(List<User> users, int totalUsers) {
    this.users = users;
    this.totalUsers = totalUsers;
  }
}
