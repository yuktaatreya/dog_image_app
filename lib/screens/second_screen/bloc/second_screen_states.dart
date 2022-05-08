import 'package:image_app/screens/first_screen/api/responses/user_image_response.dart';
import 'package:image_app/screens/second_screen/api/responses/post_response.dart';

abstract class SecondScreenState {
  List<PostResponse> posts = <PostResponse>[];
  bool isLoading = true;
}

class SecondScreenInitState extends SecondScreenState{
  SecondScreenInitState();
  @override
  bool get isLoading => true;
}

class PostsLoading extends SecondScreenState{
  PostsLoading();
  @override
  bool get isLoading => true;
}


class PostsFetchSuccessful extends SecondScreenState{
  List<PostResponse> _posts;
  PostsFetchSuccessful(this._posts);
  @override
  List<PostResponse> get posts =>_posts;
  @override
  bool get isLoading => false;

}

class PostsFetchFailed extends SecondScreenState {
  PostsFetchFailed();
  @override
  bool get isLoading => false;
}