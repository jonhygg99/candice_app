import 'user.dart';

class CurrentUser extends User {
  Future<void> fetchCurrentUser() async {
    print('fetching current user');
    fetchUser(0);
  }
}
