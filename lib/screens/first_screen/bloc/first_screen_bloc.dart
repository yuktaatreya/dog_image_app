import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:image_app/screens/first_screen/api/first_screen_api_service.dart';
import 'package:image_app/screens/first_screen/api/responses/user_image_response.dart';

import 'first_screen_events.dart';
import 'first_screen_states.dart';

class FirstScreenBloc extends Bloc<FirstScreenEvent,FirstScreenState>{
  FirstScreenApiService apiService;

  FirstScreenBloc(this.apiService) : super(FirstScreenInitState()) {
    on<FetchUserImage>((event, emit) async{
      emit(ImageLoading());
      FirstScreenState state = await apiService.fetchUserImage();
      emit(state);
    });
    on<SaveUserImage>((event,emit) async{
      emit (ImageLoading());
      try{
        UserImage userImage = event.userImage;
        await Hive.openBox('user_image_table');
        final userImageTable= Hive.box('user_image_table');
        userImageTable.put(userImage.id, userImage.toJson());
        print(userImageTable.get(userImage.id));
        emit(SaveImageSuccessful());
      }
      catch(e){
        emit (SaveImageFailed());
      }


    });
  }

}