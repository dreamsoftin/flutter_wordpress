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
  Future<List<wp.Posts>> posts;
  Future<List<wp.Users>> users;

  @override
  void initState() {
    super.initState();

    wordPress = wp.WordPress(
        'https://wordpress.dsoft.website', wp.WordpressContext.view);

    Future<wp.AuthResponse> auth = wordPress.authenticateUser(
        username: 'admin ', password: 'mypassword@123');

    auth.then((response) {
      fetchPosts();
    }).catchError((err) {
      print(err.message);
    });

  }

  void fetchPosts()
  {
    setState(() {
      posts = wordPress.fetchPosts();
    });
  }

  void fetchUsers()
  {
    setState(() {
      users = wordPress.fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<wp.Posts>>(
      future: posts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            itemBuilder: (context, i) {
              return Text(snapshot.data[i].title.rendered);
            },
            separatorBuilder: (context, i) {
              return Divider();
            },
            itemCount: snapshot.data.length,
          );
        } else if (snapshot.hasError) {
          wp.WordpressError err = snapshot.error as wp.WordpressError;
          return Text(err.message);
        }
        return CircularProgressIndicator();
      },
    );
  }
}
