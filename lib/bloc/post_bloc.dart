import 'package:bloc_provider/bloc_provider.dart';
import 'package:imagegallerytest/models/post_model.dart';
import 'package:imagegallerytest/use_case/get_post_use_case_request.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc implements Bloc {
  final GetPostUseCaseRequest _useCaseRequest = GetPostUseCaseRequest();
  final PublishSubject<List<PostModel>> posts =
      PublishSubject<List<PostModel>>();

  void getPosts() async {
    await _useCaseRequest
        .execute()
        .then((post) => posts.add(post))
        .catchError((error) => print(error));
  }

  @override
  void dispose() {
    posts.close();
  }
}
