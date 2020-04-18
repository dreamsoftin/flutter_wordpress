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

  void createPost(wp.User user) {
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
      postComment(user, p);
    }).catchError((err) {
      print('Failed to create post: $err');
    });
  }

//  yahya

//  =====================
//  UPDATE START
//  =====================

  void updatePost({@required int id, @required wp.User user}) {
    final post = widget.wordPress.updatePost(
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
      id: id, //
    );

    post.then((p) {
      print('Post updated successfully with ID ${p.id}');
    }).catchError((err) {
      print('Failed to update post: $err');
    });
  }

  void updateComment({@required int id, @required int postId, @required wp.User user}) {
    final comment = widget.wordPress.updateComment(
      comment: new wp.Comment(
        content: "Comment Updated!",
        author: user.id,
        post: postId,
      ),
      id: id,
    );

    comment.then((c) {
      print('Comment updated successfully with ID ${c.id}');
    }).catchError((err) {
      print('Failed to update Comment: $err');
    });
  }

  void updateUser({@required int id}) {
    final user = widget.wordPress.updateUser(
      user: new wp.User(
        description: "This is description for this user",
      ),
      id: id,
    );

    user.then((u) {
      print('User updated successfully with ID ${u.id}');
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

  void deletePost({@required int id}) {
    final post = widget.wordPress.deletePost(id: id);
    post.then((p) {
      print('Post Deleted successfully with ID: ${p.id}');
    }).catchError((err) {
      print('Failed to Delete post: $err');
    });
  }

  void deleteComment({@required int id}) {
    final comment = widget.wordPress.deleteComment(id: id);
    comment.then((c) {
      print('Comment Deleted successfully with ID: ${c.id}');
    }).catchError((err) {
      print('Failed to Delete comment: $err');
    });
  }

  void deleteUser({@required int id}) {
    final comment = widget.wordPress.deleteUser(id: id);
    comment.then((u) {
      print('User Deleted successfully with ID: ${u.id}');
    }).catchError((err) {
      print('Failed to Delete user: $err');
    });
  }

//  =====================
//  DELETE END
//  =====================

//  end yahya

  void postComment(wp.User user, wp.Post post) {
    final comment = widget.wordPress.createComment(
      comment: new wp.Comment(
        author: user.id,
        post: post.id,
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
              style: Theme.of(context).textTheme.title,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  author,
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                  ),
                ),
                RaisedButton.icon(
                  onPressed: () {
                    updatePost(user: widget.user, id: id);
                  },
                  icon: Icon(Icons.settings),
                  label: Text(
                    "Update",
                  ),
                ),
                RaisedButton.icon(
                  onPressed: () {
                    deletePost(id: id);
                  },
                  icon: Icon(Icons.settings),
                  label: Text(
                    "Delete",
                  ),
                ),
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
