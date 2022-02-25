import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;

import 'post_page.dart';

class PostListPage extends StatelessWidget {
  final wp.WordPress wordPress;
  final wp.User user;

  PostListPage({Key key, @required this.wordPress, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Center(
        child: PostsBuilder(
          wordPress: wordPress,
          user: user,
        ),
      ),
    );
  }
}

class PostsBuilder extends StatefulWidget {
  final wp.WordPress wordPress;
  final wp.User user;

  PostsBuilder({Key key, @required this.wordPress, this.user});

  @override
  PostsBuilderState createState() => PostsBuilderState();
}

class PostsBuilderState extends State<PostsBuilder> {
  final paddingCardsList = EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0);
  final padding_4 = EdgeInsets.all(4.0);
  final padding_8 = EdgeInsets.all(8.0);
  final padding_16 = EdgeInsets.all(16.0);

  Future<List<wp.Post>> posts;

  @override
  void initState() {
    super.initState();

    fetchPosts();
  }

  void createPost({@required wp.User user}) {
    final post = widget.wordPress.createPost(
      post: new wp.Post(
        title: 'First post as a Chief Editor',
        content: 'Blah! blah! blah!',
        excerpt: 'Discussion about blah!',
        authorID: user.id,
        commentStatus: wp.PostCommentStatus.open,
        pingStatus: wp.PostPingStatus.closed,
        status: wp.PostPageStatus.publish,
        format: wp.PostFormat.standard,
        sticky: true,
      ),
    );

    post.then((p) {
      print('Post created successfully with ID: ${p.id}');
    }).catchError((err) {
      print('Failed to create post: $err');
    });
  }

//  yahya

  Future<void> createUser({@required String email, @required String username, @required String password, @required List<String> roles}) async {
    await widget.wordPress.createUser(
      user: wp.User(
        email: email,
        password: password,
        username: username,
        roles: roles
      )
    ).then((p) {
      print('User created successfully ${p}');
    }).catchError((err) {
      print('Failed to create user: $err');
    });
  }

//  =====================
//  UPDATE START
//  =====================

  Future<void> updatePost({@required int id, @required int userId}) async {
    await widget.wordPress.updatePost(
      post: new wp.Post(
        title: 'First post as a Chief Editor',
        content: 'Blah! blah! blah!',
        excerpt: 'Discussion about blah!',
        authorID: userId,
        commentStatus: wp.PostCommentStatus.open,
        pingStatus: wp.PostPingStatus.closed,
        status: wp.PostPageStatus.publish,
        format: wp.PostFormat.standard,
        sticky: true,
      ),
      id: id, //
    ).then((p) {
      print('Post updated successfully with ID ${p}');
    }).catchError((err) {
      print('Failed to update post: $err');
    });
  }

  Future<void> updateComment({@required int id, @required int postId, @required wp.User user}) async {
    await widget.wordPress.updateComment(
      comment: new wp.Comment(
        content: "Comment Updated2!",
        author: user.id,
        post: postId,
      ),
      id: id,
    ).then((c) {
      print('Comment updated successfully "$c"');
    }).catchError((err) {
      print('Failed to update Comment: $err');
    });
  }

  Future<void> updateUser({@required int id, @required String username, @required String email}) async {
    await widget.wordPress.updateUser(
      user: new wp.User(
        description: "This is description for this user",
        username: username,
        id: id,
        email: email
      ),
      id: id,
    ).then((u) {
      print('User updated successfully $u');
    }).catchError((err) {
      print('Failed to update User: $err');
    });
  }

//  =====================
//  UPDATE END
//  =====================

//  =====================
//  DELETE START
//  =====================

  Future<void> deletePost({@required int id}) async {
    await widget.wordPress.deletePost(id: id).then((p) {
      print('Post Deleted successfully: $p');
    }).catchError((err) {
      print('Failed to Delete post: $err');
    });
  }

  Future<void> deleteComment({@required int id}) async {
    await widget.wordPress.deleteComment(id: id).then((c) {
      print('Comment Deleted successfully: $c');
    }).catchError((err) {
      print('Failed to Delete comment: $err');
    });
  }

  Future<void> deleteUser({@required int id, @required int reassign}) async {
    await widget.wordPress.deleteUser(id: id, reassign: reassign).then((u) {
      print('User Deleted successfully: $u');
    }).catchError((err) {
      print('Failed to Delete user: $err');
    });
  }

//  =====================
//  DELETE END
//  =====================

//  end yahya

  void createComment({@required int userId, @required int postId}) {
    final comment = widget.wordPress.createComment(
      comment: new wp.Comment(
        author: userId,
        post: postId,
        content: "First!",
        parent: 0,
      ),
    );

    comment.then((c) {
      print('Comment successfully posted with ID: ${c.id}');
    }).catchError((err) {
      print('Failed to comment: $err');
    });
  }

  Future<void> fetchPosts() {
    setState(() {
      posts = widget.wordPress.fetchPosts(
        postParams: wp.ParamsPostList(perPage: 1),
        fetchAuthor: true,
        fetchFeaturedMedia: true,
      );
    });
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<wp.Post>>(
      future: posts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return RefreshIndicator(
            child: ListView.builder(
              itemBuilder: (context, i) {
                int id = snapshot.data[i].id;
                String title = snapshot.data[i].title.rendered;
                String author = snapshot.data[i].author.name;
                String content = snapshot.data[i].content.rendered;
                wp.Media featuredMedia = snapshot.data[i].featuredMedia;

                return Padding(
                  padding: paddingCardsList,
                  child: GestureDetector(
                    onTap: () {
                      openPostPage(snapshot.data[i]);
                    },
                    child: _buildPostCard(
                      author: author,
                      title: title,
                      content: content,
                      featuredMedia: featuredMedia,
                      id : id,
                    ),
                  ),
                );
              },
              itemCount: snapshot.data.length,
            ),
            onRefresh: fetchPosts,
          );
        } else if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
            style: TextStyle(color: Colors.red),
          );
        }

        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        );
      },
    );
  }

  Widget _buildPostCard({
    String author,
    String title,
    String content,
    wp.Media featuredMedia,
    int id,
  }) {
    return Card(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          _buildFeaturedMedia(featuredMedia),
          featuredMedia == null
              ? Divider()
              : SizedBox(
                  width: 0,
                  height: 0,
                ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  author,
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    createComment(postId: 1, userId: 1);
                  },
                  icon: Icon(Icons.settings),
                  label: Text(
                    "Create New Comment",
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    updateComment(user: widget.user, id: 1, postId: 1);
                  },
                  icon: Icon(Icons.settings),
                  label: Text(
                    "Update Comment with ID #1",
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    deleteComment(id: 1);
                  },
                  icon: Icon(Icons.settings),
                  label: Text(
                    "Delete Comment with ID #1",
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    updatePost(userId: widget.user.id, id: 1);
                  },
                  icon: Icon(Icons.settings, color: Colors.white),
                  label: Text(
                    "Update Post with ID #1",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    deletePost(id: 1);
                  },
                  icon: Icon(Icons.delete, color: Colors.white),
                  label: Text(
                    "Delete Post with ID #1",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    createPost(user: widget.user);
                  },
                  icon: Icon(Icons.add_circle, color: Colors.white,),
                  label: Text(
                    "Create New Post",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    createUser(roles: ["subscriber"], username: "myUserName", password: "123", email: "myEmail@domain.com");
                  },
                  icon: Icon(Icons.add_circle, color: Colors.white,),
                  label: Text(
                    "Create New User",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    updateUser(id: 1, email: "newuser@gmaill.com", username: "newuser");
                  },
                  icon: Icon(Icons.settings, color: Colors.white,),
                  label: Text(
                    "Update User with ID #1",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    deleteUser(id: 1, reassign: 1);
                  },
                  icon: Icon(Icons.delete, color: Colors.white,),
                  label: Text(
                    "Delete User with ID #1",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedMedia(wp.Media featuredMedia) {
    if (featuredMedia == null) {
      return SizedBox(
        width: 0.0,
        height: 0.0,
      );
    }
    String imgSource = featuredMedia.mediaDetails.sizes.mediumLarge.sourceUrl;
    imgSource = imgSource.replaceAll('localhost', '192.168.6.165');
    return Center(
      child: Image.network(
        imgSource,
        fit: BoxFit.cover,
      ),
    );
  }

  void openPostPage(wp.Post post) {
    print('OnTapped');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return SinglePostPage(
          wordPress: widget.wordPress,
          post: post,
        );
      }),
    );
  }
}
