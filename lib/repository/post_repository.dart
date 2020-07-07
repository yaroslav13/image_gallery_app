import 'package:imagegallerytest/models/post_model.dart';

abstract class PostRepository{
  Future<List<PostModel>> getPosts();
}