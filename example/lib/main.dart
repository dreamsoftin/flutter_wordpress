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
      print(err);
    }

    /*if (wordPress != null)
      wordPress
          .authenticateUser(username: 'admin', password: 'hello')
          .then((user) {
        print("User: $user");
      }).catchError((err) {
        print(err.toString());
      });*/

    fetchPosts();

    /* Future<wp.JWTResponse> auth = wordPress.authenticateUser(
        username: 'admin', password: 'mypassword@123');

    auth.then((response) {
      fetchPosts();
    }).catchError((err) {
      print(err.message);
    });*/
  }

  void fetchPosts() {
    setState(() {
      posts = wordPress.fetchPosts(
          params:
              wp.ParamsPostList(order: wp.Order.asc, includeAuthorIDs: [1, 2]));
    });
  }

  void fetchUsers() {
    setState(() {
      users = wordPress.fetchUsers();
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
                  )
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
