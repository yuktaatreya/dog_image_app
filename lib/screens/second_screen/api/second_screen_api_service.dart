import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_app/constants/api_paths.dart';
import 'package:image_app/screens/second_screen/api/responses/post_response.dart';
import 'package:image_app/screens/second_screen/bloc/second_screen_states.dart';

class SecondScreenApiService {

  Future<SecondScreenState> fetchPosts()async{
    try{
      var dio = Dio();
      List<PostResponse> posts =[];
      final response = await dio.get(ApiPaths.getPosts);
      for (var element in response.data){
        posts.add(PostResponse.fromJson(element));
      }
      return PostsFetchSuccessful(posts);
    }
    catch(e,stackTrace){
      print(e);
      print(stackTrace);
      return PostsFetchFailed();
    }
  }
}