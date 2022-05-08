import 'package:equatable/equatable.dart';
import 'package:image_app/screens/first_screen/api/responses/user_image_response.dart';

abstract class FirstScreenState extends Equatable{
  final bool isLoading = true;
}

class FirstScreenInitState extends FirstScreenState{
  FirstScreenInitState();
  @override
  bool get isLoading => true;

  @override
  List<Object?> get props => [isLoading];
}

class ImageLoading extends FirstScreenState{
  ImageLoading();
  @override
  bool get isLoading => true;

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading];
}


class ImageFetchSuccessful extends FirstScreenState{
  final UserImage _userImage;
  ImageFetchSuccessful(this._userImage);
  @override
  UserImage get userImage =>_userImage;
  @override
  bool get isLoading => false;

  @override
  List<Object?> get props => [_userImage,isLoading];

}

class ImageFetchFailed extends FirstScreenState {
  ImageFetchFailed();
  @override
  bool get isLoading => false;

  @override
  List<Object?> get props => [isLoading];
}

class SaveImageSuccessful extends FirstScreenState {
  SaveImageSuccessful();
  @override
  bool get isError => false;
  @override
  bool get isLoading => false;
  @override
  List<Object?> get props => [isLoading];

}
class SaveImageFailed extends FirstScreenState {
  SaveImageFailed();
  @override
  bool get isError => true;
  @override
  bool get isLoading => false;
  @override
  List<Object?> get props => [isLoading];

}