import 'package:image_app/screens/first_screen/api/responses/user_image_response.dart';

abstract class FirstScreenState {
  bool isLoading = true;
}

class FirstScreenInitState extends FirstScreenState{
  FirstScreenInitState();
  @override
  bool get isLoading => true;
}

class ImageLoading extends FirstScreenState{
  ImageLoading();
  @override
  bool get isLoading => true;
}


class ImageFetchSuccessful extends FirstScreenState{
  UserImage _userImage;
  ImageFetchSuccessful(this._userImage);
  @override
  UserImage get userImage =>_userImage;
  @override
  bool get isLoading => false;

}

class ImageFetchFailed extends FirstScreenState {
  ImageFetchFailed();
  @override
  bool get isLoading => false;
}