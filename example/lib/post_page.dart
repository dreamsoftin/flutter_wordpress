import 'package:flutter/material.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:flutter_html/flutter_html.dart';

class SinglePostPage extends StatelessWidget {
  final wp.WordPress wordPress;
  final wp.Post post;

  SinglePostPage({Key key, @required this.wordPress, @required this.post});

  @override
  Widget build(BuildContext context) {
    String _title = post.title.rendered;

    String _content = post.content.rendered;
    _content = _content.replaceAll('localhost', '192.168.6.165');

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: ListView(
        children: <Widget>[
          Html(
            data: _content,
            blockSpacing: 0.0,
          ),
          Divider(),
          Row(
            children: <Widget>[
              Icon(Icons.comment),
              Text('Comments'),
            ],
          ),
          Divider(),
          _buildComments(),
        ],
      ),
    );
  }

  Widget _buildComments() {
    if (post.comments == null) {
      return SizedBox(
        width: 0,
        height: 0,
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 200),
      child: ListView.separated(
        itemBuilder: (context, i) {
          return Html(
            data: post.comments[i].content.rendered,
            blockSpacing: 0.0,
          );
        },
        separatorBuilder: (context, i) {
          return Divider();
        },
        itemCount: post.comments.length,
      ),
    );
  }
}
