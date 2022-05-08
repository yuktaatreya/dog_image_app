void main() {
  MockAppRepository repository = MockAppRepository();
  setUp(() {
    repository = MockAppRepository();
  });

  group('LoginBloc test', () {
    final user =
    User(1, 'email', 'firstName', 'lastName', 'status', 'username', null);

    test('emits LoginLoading & LoginSuccess after successful login', () {
      when(repository.logIn('email', 'password'))
          .thenAnswer((realInvocation) async => user);

      final bloc = LoginBloc(repository);
      bloc.add(LogIn('email', 'password'));

      expectLater(
          bloc,
          emitsInOrder([
            LoginInitial(),
            LoginLoading(),
            LoginSuccess(user),
          ]));
    });

    blocTest<LoginBloc, LoginState>(
      'emits LoginLoading & LoginSuccess after successful login',
      build: () {
        when(repository.logIn('email', 'password'))
            .thenAnswer((realInvocation) async => user);
        return LoginBloc(repository);
      },
      act: (bloc) => bloc.add(LogIn('email', 'password')),
      expect: () => [
        LoginInitial(),
        LoginLoading(),
        LoginSuccess(user),
      ],
    );
  });
}
