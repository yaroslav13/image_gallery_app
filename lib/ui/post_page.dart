import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagegallerytest/bloc/post_bloc.dart';
import 'package:imagegallerytest/models/post_model.dart';
import 'package:imagegallerytest/resources/app_colors.dart';
import 'package:imagegallerytest/ui/post_tile.dart';

class PostsPage extends StatefulWidget {
  @override
  _ImageListPageState createState() => _ImageListPageState();
}

class _ImageListPageState extends State<PostsPage> {
  PostBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<PostBloc>(context);
    _bloc.getPosts();
  }

  @override
  Widget build(BuildContext context) => Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.background,
        child: StreamBuilder<List<PostModel>>(
          stream: _bloc.posts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: snapshot.data.length,
                  separatorBuilder: (context, i) => const Divider(height: 1.0),
                  itemBuilder: (context, int i) {
                    return PostTile(
                      post: snapshot.data[i],
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      );
}
