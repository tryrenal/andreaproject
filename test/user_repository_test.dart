import 'package:andreaproject/user_model.dart';
import 'package:andreaproject/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHttpClient mockHttpClient;

  setUp(() {
    //given
    mockHttpClient = MockHttpClient();
    userRepository = UserRepository(mockHttpClient);
  });

  group('User Repository -', () {
    group('getUser function', () {
      test(
        'given user repository when getuser call and status is 200 then should be returend',
        () async {
          //given
          when(
            () => mockHttpClient.get(
              Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
            ),
          ).thenAnswer((invocation) async {
            return Response('''
            {
              "id": 1,
              "name": "Leanne Graham",
              "username": "Bret",
              "email": "Sincere@april.biz",
              "website": "hildegard.org"
            }
            ''', 200);
          });
          //when
          final user = await userRepository.getUser();
          //then
          expect(user, isA<User>());
        },
      );

      test(
        'given userrepository class when getuser function is called and status code is not 200 then expected should be returned',
        () async {
          //given
          when(
            () => mockHttpClient.get(
              Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
            ),
          ).thenAnswer((invocation) async {
            return Response('', 500);
          });
          //when
          final user = userRepository.getUser();
          //then
          expect(user, throwsException);
        },
      );
    });
  });
}
