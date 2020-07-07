import 'package:imagegallerytest/data/dio_client.dart';
import 'package:imagegallerytest/models/post_model.dart';
import 'package:imagegallerytest/repository/post_repository.dart';
import 'package:imagegallerytest/resources/app_api.dart';

class RestPostRepository implements PostRepository {
  DioClient _client;

  RestPostRepository() : _client = DioClient();

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await _client.get(AppApi.photo + AppApi.clientId);
    List<PostModel> posts = [];
    for (var post in response) {
      posts.add(PostModel.fromJson(post));
    }
    return posts;
  }
}
