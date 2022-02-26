import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:flutter_wordpress_example/service/comments_service.dart';

import 'service/auth_service.dart';

class SinglePostPage extends StatelessWidget {
  final wp.Post post;

  SinglePostPage({Key? key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title?.rendered ?? ""),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: PostWithComments(post: post),
      ),
    );
  }
}

class PostWithComments extends StatefulWidget {
  final wp.Post post;

  PostWithComments({required this.post});

  @override
  PostWithCommentsState createState() => PostWithCommentsState();
}

class PostWithCommentsState extends State<PostWithComments> {
  late String _content;

  late Future<List<wp.CommentHierarchy>> _comments;

  @override
  void initState() {
    super.initState();

    _content = widget.post.content?.rendered ?? "";
    _content = _content.replaceAll('localhost', '192.168.6.165');

    fetchComments();
  }

  void fetchComments() {
    // setState(() {
    _comments = CommentsService.instance.fetchCommentsAsHierarchy(
        params: wp.ParamsCommentList(
      includePostIDs: widget.post.id == null ? [] : [widget.post.id!],
    ));
    // });
  }

  Future<void> createComment(String text, int parent) async {
    await CommentsService.instance.create(wp.Comment(
      author: AuthService.instance.currentUser!.id!,
      post: widget.post.id,
      content: text,
      parent: parent,
    ));
    fetchComments();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Html(
                data: _content,
                // blockSpacing: 0.0,
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Icon(Icons.comment),
                  Text('Comments'),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add))
                ],
              ),
              CommenttextField(
                comment: (value) {
                  createComment(value, 0);
                },
              ),
              Divider(),
            ],
          ),
        ),
        FutureBuilder<List<wp.CommentHierarchy>>(
          future: _comments,
          builder: (context, snapshot) {
            return SliverList(
              delegate: _buildCommentsSection(snapshot),
            );
          },
        ),
      ],
    );
  }

  SliverChildDelegate _buildCommentsSection(
      AsyncSnapshot<List<wp.CommentHierarchy>?> snapshot) {
    if (snapshot.hasData) {
      return _buildComments(snapshot.data);
    } else if (snapshot.hasError) {
      return SliverChildListDelegate([
        Text(
          'Error fetching comments: ${snapshot.error.toString()}',
          style: TextStyle(
            color: Colors.red,
          ),
        )
      ]);
    }

    return SliverChildListDelegate(
      [
        Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
        ),
      ],
    );
  }

  SliverChildBuilderDelegate _buildComments(
      List<wp.CommentHierarchy>? comments) {
    return SliverChildBuilderDelegate(
      (BuildContext context, int i) {
        if (comments == null || comments.length == 0) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'No comments',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          );
        }

        if (i % 2 != 0) {
          return Divider();
        }
        return _buildCommentTile(comments[(i / 2).ceil()]);
      },
      childCount:
          comments == null || comments.length == 0 ? 1 : comments.length * 2,
    );
  }

  Widget _buildCommentTile(wp.CommentHierarchy root) {
    if (root.children == null) {
      return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Html(
              data: root.comment.content?.rendered ?? "",
              // blockSpacing: 0.0,
            ),
            Text(
              root.comment.authorName ?? "",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
              ),
            ),
            CommenttextField(comment: (text) {
              createComment(text, root.comment.id!);
            })
          ],
        ),
      );
    } else {
      return ExpansionTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Html(
              data: root.comment.content?.rendered ?? "",
              // blockSpacing: 0.0,
            ),
            Text(
              root.comment.authorName ?? "",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            CommentsService.instance.delete(root.comment.id!);
          },
          icon: Icon(Icons.delete),
        ),
        children: [
          ...(root.children ?? []).map((c) {
            return Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: _buildCommentTile(c),
            );
          }).toList(),
          CommenttextField(comment: (text) {
            createComment(text, root.comment.id!);
          })
        ],
      );
    }
  }
}

class CommenttextField extends StatelessWidget {
  CommenttextField({Key? key, required this.comment}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  final ValueChanged<String> comment;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: TextField(
          controller: controller,
        )),
        ElevatedButton(
            onPressed: () {
              comment.call(controller.text);
              controller.clear();
            },
            child: Text("Comment"))
      ],
    );
  }
}
