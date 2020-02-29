abstract class User {
  String id;
  String backgroundImage;
  String userName;
  String photoProfile;
  String profession;
  String description;
  String contributeDescription;

  Future<void> fetchUser(userId) async {
    backgroundImage =
        'https://images.unsplash.com/photo-1580331451062-99ff652288d7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80';
    userName = 'Laia Montés';
  }
}
