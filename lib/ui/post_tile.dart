import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagegallerytest/models/post_model.dart';
import 'package:imagegallerytest/ui/detail_page.dart';

class PostTile extends StatelessWidget {
  final PostModel post;

  const PostTile({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        _PostContent(post: post),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

class _PostContent extends StatelessWidget {
  final PostModel post;

  const _PostContent({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _navigateToDetailPage(context),
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 10.0, end: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                    imageUrl: post.urls.url,
                    height: 80.0,
                    width: 80.0,
                    fit: BoxFit.cover),
                const SizedBox(width: 10.0),
                Expanded(
                  child: _PostDescription(
                      description: post.description,
                      altDescription: post.altDescription),
                ),
              ],
            ),
          ),
        ));
  }

  void _navigateToDetailPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => DetailPage(urls: post.urls),
      ),
    );
  }
}

class _PostDescription extends StatelessWidget {
  final String altDescription;
  final String description;

  const _PostDescription({Key key, this.altDescription, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null)
          Text(description,
              style: Theme.of(context).textTheme.subtitle1,
              overflow: TextOverflow.ellipsis),
        const SizedBox(height: 5.0),
        if (altDescription != null)
          Text(altDescription ?? ' ',
              style: Theme.of(context).textTheme.bodyText1,
              overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
