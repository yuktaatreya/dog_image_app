
import 'package:image_app/screens/first_screen/api/first_screen_api_service.dart';
import 'package:image_app/screens/first_screen/api/responses/user_image_response.dart';
import 'package:image_app/screens/first_screen/bloc/first_screen_bloc.dart';
import 'package:image_app/screens/first_screen/bloc/first_screen_events.dart';
import 'package:image_app/screens/first_screen/bloc/first_screen_states.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockFirstScreenApiService extends Mock implements FirstScreenApiService{}


void main(){
  late FirstScreenBloc firstScreenBloc;
  MockFirstScreenApiService mockFirstScreenApiService;
  setUp((){
    mockFirstScreenApiService=MockFirstScreenApiService();
    firstScreenBloc=FirstScreenBloc(mockFirstScreenApiService);

  });

  group("First Screen Bloc test", (){
    test('initial state should be NoTerm', () async {
      await expectLater(firstScreenBloc.state, emitsInOrder([initState]));
    });

    test('api returns results', () async {

      when(()=> firstScreenBloc.apiService.fetchUserImage()).thenAnswer((_) async {
        return ImageFetchSuccessful(UserImage(fileSizeBytes:2105001,url: "https://random.dog/4269edc8-56bd-49d9-8288-78f824b8f701.JPG"));
      });

      expect(firstScreenBloc.state, emitsInOrder([initState, loading, successful]));
      firstScreenBloc.add(FetchUserImage());
    });

  });

}
const initState= TypeMatcher<FirstScreenInitState>();
const loading = TypeMatcher<ImageLoading>();
const successful = TypeMatcher<ImageFetchSuccessful>();
const error = TypeMatcher<ImageFetchFailed>();