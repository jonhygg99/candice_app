import 'pastJobs.dart';
import 'post.dart';

abstract class User {
  int id;
  bool goBack;
  String backgroundImage;
  String userName;
  String photoProfile;
  String profession;
  String description;
  bool contributeBubble;
  String contributeDescription;
  List<Post> posts = [];
  int reviews;
  List<PastJob> pastJobs = []; // TODO

  Future<void> fetchUser(userId) async {
    if (userId == 0) {
      id = 0;
      goBack = false;
      backgroundImage =
          'https://images.unsplash.com/photo-1580331451062-99ff652288d7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80';
      userName = 'Laia Montés';
      photoProfile =
          'https://images.unsplash.com/photo-1578680671705-0965e325b2ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1233&q=80';
      profession = 'Singer and Guitarrist';
      description =
          'I’m a musician who loves Pop and Rock. 🤘 Currently studying for being a lawyer, but what I truly want is to sing in the shower.';
      contributeBubble = true;
      contributeDescription =
          'Small steps every day will bring what I truly want! 😇';
      posts.removeRange(0, posts.length);
      posts.add(Post(
        id: id,
        userName: userName,
        photoProfile: photoProfile,
        title: 'Break my soul',
        backgroundImage:
            'https://images.unsplash.com/photo-1581289098325-fd41f57a9d4e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1601&q=80',
        audio: null,
        video: null,
      ));
      posts.add(Post(
        id: id,
        userName: userName,
        photoProfile: photoProfile,
        title: 'Give me light',
        backgroundImage:
            'https://images.unsplash.com/photo-1583135494815-6fb8be21cd6c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
        audio: null,
        video: null,
      ));
      posts.add(Post(
        id: id,
        userName: userName,
        photoProfile: photoProfile,
        title: 'Happy for life',
        backgroundImage:
            'https://images.unsplash.com/photo-1583129553919-60e6b59ab740?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1300&q=80',
        audio: null,
        video: null,
      ));
      pastJobs.removeRange(0, pastJobs.length);
      pastJobs.add((PastJob(
        id: id,
        userName: 'Kathryn Cooper',
        photoProfile:
            'https://images.unsplash.com/photo-1582786769327-58d97354cd31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
        stars: 3.5,
        textReview:
            'Est est tempor sit commodo dolore sit commodo Lorem in nulla cillum ex magna adipisicing consectetur elit',
      )));
      pastJobs.add((PastJob(
        id: id,
        userName: 'Kathryn Cooper',
        photoProfile:
            'https://images.unsplash.com/photo-1582786769327-58d97354cd31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
        stars: 3.5,
        textReview:
            'Est est tempor sit commodo dolore sit commodo Lorem in nulla cillum ex magna adipisicing consectetur elit',
      )));
    } else {
      id = 1;
      goBack = true;
      backgroundImage =
          'https://images.unsplash.com/photo-1583028281359-bdbfd8639b78?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80';
      userName = 'Julie Howard';
      photoProfile =
          'https://images.unsplash.com/photo-1536896407451-6e3dd976edd1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80';
      profession = 'Pianist';
      description = 'I like pink unicorns 🦄';
      contributeBubble = false;
      posts.removeRange(0, posts.length);
      posts.add(
        Post(
          id: id,
          userName: userName,
          photoProfile: photoProfile,
          title: 'From the ashes',
          backgroundImage:
              'https://images.unsplash.com/photo-1583144938558-c6d977616383?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
          audio: null,
          video: null,
        ),
      );
    }
  }
}
