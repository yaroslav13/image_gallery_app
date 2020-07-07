import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:imagegallerytest/models/post_model.dart';
import 'package:imagegallerytest/resources/app_colors.dart';

class DetailPage extends StatelessWidget {
  final ImageUrl urls;

  const DetailPage({Key key, this.urls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: CachedNetworkImage(imageUrl: urls.url, fit: BoxFit.cover),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        child: const Icon(Icons.arrow_back, color: AppColors.onPrimary),
        onTap: () => Navigator.pop(context),
      ),
    );
  }
}
