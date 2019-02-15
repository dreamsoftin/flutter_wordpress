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
        authenticator: wp.WordPressAuthenticator.ApplicationPasswords,
        adminName: 'admin',
        adminKey: 'EOjD JsYA hKfM RHNI vufW hyUX',
      );
    } catch (err) {
      print(err.toString());
    }

    fetchPosts();

    Future<List<wp.User>> users = wordPress.fetchUsers(
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
              print(
                  "Post Status: ${snapshot.data[i].status} ${snapshot.data[i].format} ${snapshot.data[i].commentStatus} ${snapshot.data[i].pingStatus}");
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
