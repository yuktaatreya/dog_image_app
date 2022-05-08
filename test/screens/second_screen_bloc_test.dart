import 'package:bloc_test/bloc_test.dart';
import 'package:image_app/screens/second_screen/api/second_screen_api_service.dart';
import 'package:image_app/screens/second_screen/bloc/second_screen_bloc.dart';
import 'package:image_app/screens/second_screen/bloc/second_screen_events.dart';

import 'package:image_app/screens/second_screen/bloc/second_screen_states.dart';
import 'package:image_app/screens/second_screen/api/responses/post_response.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockSecondScreenApiService extends Mock implements SecondScreenApiService{}


void main (){
  late MockSecondScreenApiService mockSecondScreenApiService;

  List<PostResponse> posts=[
    PostResponse(userId: 1, id: 4, title: "eum et est occaecati", body: "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit"),
    PostResponse(userId: 1, id: 4, title: "eum et est occaecati", body: "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit")

  ];

  setUp((){
    mockSecondScreenApiService=MockSecondScreenApiService();
    when(mockSecondScreenApiService.fetchPosts).
    thenAnswer((_)  =>Future.value(
        PostsFetchSuccessful(posts)
    )
    );

  });
  group("Fetch Posts", (){
    blocTest<SecondScreenBloc,SecondScreenState>(
      'emits [PostsLoading, PostsFetchSuccessful] when successful',
      setUp: () {
        when(mockSecondScreenApiService.fetchPosts).
        thenAnswer((_)  =>Future.value(
            PostsFetchSuccessful(posts)
        ));
      },
      build: () =>SecondScreenBloc(mockSecondScreenApiService),
      act: (bloc) => bloc.add(FetchPosts()),
      expect:()=> [PostsLoading(),PostsFetchSuccessful(posts)],
    );
    blocTest<SecondScreenBloc,SecondScreenState>(
      'emits [PostsLoading, PostsFetchFailed] when api fails',
      setUp: () {
        when(mockSecondScreenApiService.fetchPosts).
        thenAnswer((_)  =>Future.value(
            PostsFetchFailed()
        ));
      },
      build: () =>SecondScreenBloc(mockSecondScreenApiService),
      act: (bloc) => bloc.add(FetchPosts()),
      expect:()=> [PostsLoading(),PostsFetchFailed()],
    );
  });
}