import 'package:flutter/material.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: PostsBuilder(),
      ),
    );
  }
}

class PostsBuilder extends StatefulWidget {
  @override
  PostsBuilderState createState() => PostsBuilderState();
}

class PostsBuilderState extends State<PostsBuilder> {
  wp.WordPress wordPress;
  Future<List<wp.Post>> posts;
  Future<List<wp.User>> users;

  @override
  void initState() {
    super.initState();

    try {
      wordPress = wp.WordPress(
        baseUrl: 'http://192.168.6.165',
        authenticator: wp.WordPressAuthenticator.JWT,
//        adminName: 'admin',
//        adminKey: 'EOjD JsYA hKfM RHNI vufW hyUX',
      );
    } catch (err) {
      print(err.toString());
    }

    Future<wp.User> response = wordPress.authenticateUser(
      username: 'ChiefEditor',
      password: 'chiefeditor@123',
    );

    response.then((user) {
      createPost(user);
    }).catchError((err) {
      print('Failed to fetch user: $err');
    });

    fetchPosts();

    /*Future<List<wp.User>> users = wordPress.fetchUsers(
      params: wp.ParamsUserList(
        context: wp.WordPressContext.view,
        pageNum: 1,
        perPage: 30,
        order: wp.Order.asc,
        orderBy: wp.UserOrderBy.name,
      ),
    );

    users.then((response) {
      print(response);
    }).catchError((err) {
      print(err.toString());
    });

    Future<List<wp.Comment>> comments = wordPress.fetchComments(
      params: wp.ParamsCommentList(
        context: wp.WordPressContext.view,
        pageNum: 1,
        perPage: 30,
      ),
    );

    comments.then((response) {
      print(response);
    }).catchError((err) {
      print(err.toString());
    });

    Future<List<wp.Page>> pages = wordPress.fetchPages(
      params: wp.ParamsPageList(),
    );
    pages.then((response) {
      print(response);
    }).catchError((err) {
      print(err.toString());
    });

    Future<List<wp.Category>> categories = wordPress.fetchCategories(
      params: wp.ParamsCategoryList(),
    );
    categories.then((response) {
      print(response);
    }).catchError((err) {
      print(err.toString());
    });

    Future<List<wp.Tag>> tags = wordPress.fetchTags(
      params: wp.ParamsTagList(),
    );
    tags.then((response) {
      print(response);
    }).catchError((err) {
      print(err.toString());
    });*/
  }

  void createPost(wp.User user) {
    final post = wordPress.createPost(
      post: new wp.Post(
        title: 'First post as a Chief Editor',
        content: 'Blah! blah! blah!',
        excerpt: 'Discussion about blah!',
        author: user.id,
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

  void postComment(wp.User user, wp.Post post) {
    final comment = wordPress.createComment(
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

  void fetchPosts() {
    setState(() {
      posts = wordPress.fetchPosts(params: wp.ParamsPostList());
    });
  }

  void fetchUsers() {
    setState(() {
      users = wordPress.fetchUsers(params: wp.ParamsUserList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<wp.Post>>(
      future: posts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            itemBuilder: (context, i) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    snapshot.data[i].title.rendered,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    snapshot.data[i].content.rendered,
                  ),
                ],
              );
            },
            separatorBuilder: (context, i) {
              return Divider();
            },
            itemCount: snapshot.data.length,
          );
        } else if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
            style: TextStyle(color: Colors.red),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
