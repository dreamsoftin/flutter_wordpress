import 'package:flutter/material.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:html/dom.dart' as dom;
import 'package:flutter_html/flutter_html.dart';

class PostsPage extends StatefulWidget {
  final wp.WordPress wordPress;

  PostsPage({Key key, @required this.wordPress});

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Center(
        child: PostsBuilder(
          wordPress: widget.wordPress,
        ),
      ),
    );
  }
}

class PostsBuilder extends StatefulWidget {
  final wp.WordPress wordPress;

  PostsBuilder({Key key, @required this.wordPress});

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

  void fetchMedia() {
    final media = widget.wordPress.fetchMediaList(params: wp.ParamsMediaList());

    media.then((media) {
      print(media);
    }).catchError((err) {
      print(err.toString());
    });
  }

  void createPost(wp.User user) {
    final post = widget.wordPress.createPost(
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
      posts = widget.wordPress.fetchPosts(params: wp.ParamsPostList());
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
                final title = snapshot.data[i].title.rendered;
                String content = snapshot.data[i].content.rendered;
                content = content.replaceAll(
                    new RegExp(r'localhost'), '192.168.6.165');
                return Padding(
                  padding: paddingCardsList,
                  child: _buildPostCard(title: title, content: content),
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

  Widget _buildPostCard({String title, String content}) {
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
          Divider(),
          Padding(
            padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: Html(
                blockSpacing: 0.0,
                data: content,
                /*customRender: (node, children) {
                  if (node is dom.Element) {
                    switch (node.localName) {
                      case 'img':
                        final src = node.attributes['src'];
                        return Image.network(
                          src,
                          scale: 2,
                        );
                    }
                  }
                },*/
              ),
            ),
          )
        ],
      ),
    );
  }
}
