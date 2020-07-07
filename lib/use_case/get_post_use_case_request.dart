import 'package:imagegallerytest/models/post_model.dart';
import 'package:imagegallerytest/repository/post_repository.dart';
import 'package:imagegallerytest/repository/rest_post_repository.dart';

class GetPostUseCaseRequest {
  final PostRepository _postRepository;

  GetPostUseCaseRequest() : _postRepository = RestPostRepository();

  Future<List<PostModel>> execute() => _postRepository.getPosts();
}
