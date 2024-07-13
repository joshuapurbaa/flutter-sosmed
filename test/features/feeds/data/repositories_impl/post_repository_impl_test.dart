import 'package:flutter_sosmed/features/feeds/data/repositories_impl/post_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks.mocks.dart';

void main() {
  late MockPostApi mockPostApi;
  late PostRepositoryImpl postRepositoryImpl;

  setUp(() {
    mockPostApi = MockPostApi();
    postRepositoryImpl = PostRepositoryImpl(mockPostApi);

    provideDummy(() => unit);
  });

  group(
    'PostRepositoryImpl',
    () {
      test(
        'deletePost returns right value of unit',
        () async {
          when(mockPostApi.deletePost(any)).thenAnswer((_) async => unit);

          final result = await postRepositoryImpl.deletePost(1);

          expect(result.isRight(), true);
        },
      );
    },
  );
}
