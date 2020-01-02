import 'user.dart';

class FetchUsersResult {
  List<User> users;
  int totalUsers;
  int currentPage;

  FetchUsersResult(List<User> users, int totalUsers, int currentPage) {
    this.users = users;
    this.totalUsers = totalUsers;
    this.currentPage = currentPage;
  }
}
