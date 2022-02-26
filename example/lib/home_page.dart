import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart';
import 'package:flutter_wordpress_example/login.dart';
import 'package:flutter_wordpress_example/post_page.dart';
import 'package:flutter_wordpress_example/service/auth_service.dart';
import 'package:flutter_wordpress_example/service/post_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PagewiseLoadController<Post> pagewiseLoadController = PagewiseLoadController(
      pageFuture: (pageIndex) {
        return PostService.instance.getPosts((pageIndex ?? 0) + 1, 10);
      },
      pageSize: 10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (AuthService.instance.currentUser == null)
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                icon: Icon(Icons.login))
          else
            IconButton(
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (context) => Scaffold(
                            appBar: AppBar(),
                            body: PostForm(),
                          ));
                  setState(() {});
                  pagewiseLoadController.reset();
                },
                icon: Icon(Icons.add))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          pagewiseLoadController.reset();
        },
        child: PagewiseListView<Post>(
            pageLoadController: pagewiseLoadController,
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
                    Text(
                        entry.categories?.map((e) => e.name).join(" ,") ?? "--")
                  ],
                ),
                trailing: IconButton(
                    onPressed: () async {
                      await PostService.instance.delete(entry.id!);
                      pagewiseLoadController.reset();
                    },
                    icon: Icon(Icons.delete)),
              );
            })),
      ),
    );
  }
}

class PostForm extends StatelessWidget {
  PostForm({Key? key}) : super(key: key);
  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();
  final TextEditingController excerpt = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: title,
            decoration: InputDecoration(labelText: "Title"),
            validator: (value) {
              return (value?.isEmpty ?? true) ? "*Required" : null;
            },
          ),
          TextFormField(
            controller: content,
            decoration: InputDecoration(
              labelText: "Content",
            ),
            validator: (value) {
              return (value?.isEmpty ?? true) ? "*Required" : null;
            },
          ),
          TextFormField(
            controller: excerpt,
            decoration: InputDecoration(labelText: "Excerpt"),
            validator: (value) {
              return (value?.isEmpty ?? true) ? "*Required" : null;
            },
          ),
          ElevatedButton(
              onPressed: () {
                createPost(context);
              },
              child: Text("Create post"))
        ],
      ),
    );
  }

  Future<void> createPost(context) async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        await PostService.instance.create(Post(
            title: title.text,
            content: content.text,
            excerpt: excerpt.text,
            authorID: AuthService.instance.currentUser?.id ?? -1));
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("$e"),
          backgroundColor: Colors.red,
        ));
      }
    }
  }
}
