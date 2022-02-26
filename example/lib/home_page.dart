import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart';
import 'package:flutter_wordpress_example/post_page.dart';
import 'package:flutter_wordpress_example/service/post_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PagewiseListView<Post>(
          pageFuture: (pageIndex) {
            return PostService.instance.getPosts((pageIndex ?? 0) + 1, 10);
          },
          pageSize: 10,
          itemBuilder: ((context, entry, index) {
            return ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SinglePostPage(
                          post: entry,
                        )));
              },
              title: Text(entry.title?.rendered ?? "--"),
              subtitle: Column(
                children: [
                  Text(entry.author?.name ?? ""),
                  Text(entry.categories?.map((e) => e.name).join(" ,") ?? "--")
                ],
              ),
            );
          })),
    );
  }
}
