import 'package:equatable/equatable.dart';
import 'package:image_app/screens/second_screen/api/responses/post_response.dart';

abstract class SecondScreenState extends Equatable{
  final List<PostResponse> posts = <PostResponse>[];
  final bool isLoading = true;
}

class SecondScreenInitState extends SecondScreenState{
  SecondScreenInitState();
  @override
  bool get isLoading => true;

  @override
  List<Object?> get props => [isLoading];
}

class PostsLoading extends SecondScreenState{
  PostsLoading();
  @override
  bool get isLoading => true;
  @override
  List<Object?> get props => [isLoading];
}


class PostsFetchSuccessful extends SecondScreenState{
  final List<PostResponse> _posts;
  PostsFetchSuccessful(this._posts);
  @override
  List<PostResponse> get posts =>_posts;
  @override
  bool get isLoading => false;
  @override
  List<Object?> get props => [isLoading,_posts];

}

class PostsFetchFailed extends SecondScreenState {
  PostsFetchFailed();
  @override
  bool get isLoading => false;
  @override
  List<Object?> get props => [isLoading];
}