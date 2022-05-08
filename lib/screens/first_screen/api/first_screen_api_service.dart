import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_app/constants/api_paths.dart';
import 'package:image_app/screens/first_screen/api/responses/user_image_response.dart';
import 'package:image_app/screens/first_screen/bloc/first_screen_states.dart';
import 'package:uuid/uuid.dart';

class FirstScreenApiService {

  Future<FirstScreenState> fetchUserImage()async{
    try{
      var dio = Dio();
      final response = await dio.get(ApiPaths.getUserImage);
      UserImage userImage = UserImage.fromJson(response.data);
      return ImageFetchSuccessful(userImage);
    }
    catch(e,stackTrace){
      print(stackTrace);
      return ImageFetchFailed();
    }
  }
}