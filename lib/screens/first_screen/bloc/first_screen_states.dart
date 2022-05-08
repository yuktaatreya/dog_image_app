import 'package:equatable/equatable.dart';
import 'package:image_app/screens/first_screen/api/responses/user_image_response.dart';

abstract class FirstScreenState extends Equatable{
  bool isLoading = true;
}

class FirstScreenInitState extends FirstScreenState{
  FirstScreenInitState();
  @override
  bool get isLoading => true;

  @override
  // TODO: implement props
  List<Object?> get props => [this.isLoading];
}

class ImageLoading extends FirstScreenState{
  ImageLoading();
  @override
  bool get isLoading => true;

  @override
  // TODO: implement props
  List<Object?> get props => [this.isLoading];
}


class ImageFetchSuccessful extends FirstScreenState{
  final UserImage _userImage;
  ImageFetchSuccessful(this._userImage);
  @override
  UserImage get userImage =>_userImage;
  @override
  bool get isLoading => false;

  @override
  List<Object?> get props => [this._userImage,this.isLoading];

}

class ImageFetchFailed extends FirstScreenState {
  ImageFetchFailed();
  @override
  bool get isLoading => false;

  @override
  List<Object?> get props => [this.isLoading];
}