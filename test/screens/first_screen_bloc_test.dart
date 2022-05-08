import 'package:bloc_test/bloc_test.dart';
import 'package:image_app/screens/first_screen/api/first_screen_api_service.dart';
import 'package:image_app/screens/first_screen/api/responses/user_image_response.dart';
import 'package:image_app/screens/first_screen/bloc/first_screen_bloc.dart';
import 'package:image_app/screens/first_screen/bloc/first_screen_events.dart';
import 'package:image_app/screens/first_screen/bloc/first_screen_states.dart';
import 'package:mocktail/mocktail.dart';
import 'first_screen_bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockFirstScreenApiService extends Mock implements FirstScreenApiService{}


void main (){
  late MockFirstScreenApiService mockFirstScreenApiService;
  setUp((){
    mockFirstScreenApiService=MockFirstScreenApiService();
    when(mockFirstScreenApiService.fetchUserImage).
    thenAnswer((_)  =>Future.value(
        ImageFetchSuccessful(
            UserImage(url: "https://random.dog/4269edc8-56bd-49d9-8288-78f824b8f701.JPG",
                fileSizeBytes: 2105001))
    )
    );

  });
  group("Fetch User Image", (){
    blocTest<FirstScreenBloc,FirstScreenState>(
      'emits [Imageloading, ImageFetchSuccessful] when successful',
      setUp: () {
        when(mockFirstScreenApiService.fetchUserImage).
        thenAnswer((_)  =>Future.value(
            ImageFetchSuccessful(
                UserImage(url: "https://random.dog/4269edc8-56bd-49d9-8288-78f824b8f701.JPG",
                    fileSizeBytes: 2105001))
        ));
      },
      build: () =>FirstScreenBloc(mockFirstScreenApiService),
      act: (bloc) => bloc.add(FetchUserImage()),
      expect:()=> [ImageLoading(),ImageFetchSuccessful(UserImage(url: "https://random.dog/4269edc8-56bd-49d9-8288-78f824b8f701.JPG",
          fileSizeBytes: 2105001))],
    );
    blocTest<FirstScreenBloc,FirstScreenState>(
      'emits [Imageloading, ImageFetchFailed] when api fails',
      setUp: () {
        when(mockFirstScreenApiService.fetchUserImage).
        thenAnswer((_)  =>Future.value(
            ImageFetchFailed()
        ));
      },
      build: () =>FirstScreenBloc(mockFirstScreenApiService),
      act: (bloc) => bloc.add(FetchUserImage()),
      expect:()=> [ImageLoading(),ImageFetchFailed()],
    );
  });
}