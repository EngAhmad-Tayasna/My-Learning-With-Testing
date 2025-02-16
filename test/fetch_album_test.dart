import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_learing_with_testing/album_model.dart';
import 'package:my_learing_with_testing/fetch_album.dart';

import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("fetch Album", () {
    test("called get method on client once", () {
      MockClient mockClient = MockClient();

      when(
        mockClient.get(
          Uri.parse("https://jsonplaceholder.typicode.com/albums/1"),
        ),
      ).thenAnswer((_) async {
        return http.Response('{"userId" :1,"id": 1,"title": "mock"}', 200);
      });

      fetchAlbum(mockClient);

      verify(
        mockClient.get(
          Uri.parse("https://jsonplaceholder.typicode.com/albums/1"),
        ),
      ).called(1);
    });
    test('returns an Album if the http call completes successfully', () async {
      MockClient mockClient = MockClient();

      when(
        mockClient.get(
          Uri.parse("https://jsonplaceholder.typicode.com/albums/1"),
        ),
      ).thenAnswer((_) async {
        return http.Response('{"userId" :1,"id": 1,"title": "mock"}', 200);
      });

      expect(
        await fetchAlbum(mockClient),
        isA<Album>()
            .having((album) => album.id, "id", 1)
            .having((album) => album.userId, "user id ", 1)
            .having((album) => album.title, "title", "mock"),
      );
    });

    test("throws an exception id the http call completes with an error ", () {
      MockClient mockClient = MockClient();

      when(
        mockClient.get(
          Uri.parse("https://jsonplaceholder.typicode.com/albums/1"),
        ),
      ).thenAnswer((_) async {
        return http.Response('{"errMsg" : "Page not found"}', 404);
      });

      expect(fetchAlbum(mockClient), throwsException);
    });
  });
}
