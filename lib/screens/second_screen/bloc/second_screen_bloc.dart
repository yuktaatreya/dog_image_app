import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_app/screens/second_screen/api/second_screen_api_service.dart';
import 'package:image_app/screens/second_screen/bloc/second_screen_events.dart';
import 'package:image_app/screens/second_screen/bloc/second_screen_states.dart';


class SecondScreenBloc extends Bloc<SecondScreenEvent,SecondScreenState>{
  SecondScreenApiService _apiService;

  SecondScreenBloc(this._apiService) : super(SecondScreenInitState()) {
    on<FetchPosts>((event, emit) async{
      emit(PostsLoading());
      SecondScreenState state = await _apiService.fetchPosts();
      emit(state);
    });
  }

}