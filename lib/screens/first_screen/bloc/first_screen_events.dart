import 'package:image_app/screens/first_screen/api/responses/user_image_response.dart';

abstract class FirstScreenEvent {

}

class FetchUserImage extends FirstScreenEvent {}

class SaveUserImage extends FirstScreenEvent {
  UserImage userImage;
  SaveUserImage(this.userImage);
}