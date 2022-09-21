import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:unit_test1/main.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('return an Album if the http call completes successfully', () async {
      final client = MockClient();
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async =>
              http.Response('{"userId": 1, "id": 2, "tittle": "mock"}', 200));
      expect(await fetchAlbum(client), isA<Album>());
    });
    test('throws an exception if the http call completes with an bruhh', () {
      final client = MockClient();
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchAlbum(client), throwsException);
    });
  });
}
