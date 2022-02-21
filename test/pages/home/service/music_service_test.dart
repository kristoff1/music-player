import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/network/api/music_api.dart';
import 'package:music_player/pages/home/service/model.dart';
import 'package:music_player/pages/home/service/music_service.dart';
import 'package:music_player/pages/home/view_model.dart';

import 'music_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchMusic', () {
    final MusicApi api = MusicApi();
    final client = MockClient();
    final MusicService service = MusicService();
    const String artistName = 'john mayer';
    const String query = 'john+mayer';

    setUp(() async {
      File testJson = File('assets/jsons/response_test.json');
      final testResponse = await testJson.readAsString();
      when(api.getMusicList(client, query))
          .thenAnswer((_) async => http.Response(testResponse, 200));
    });

    test('check if the network model runs properly', () async {
      http.Response response = await api.getMusicList(client, query);
      expect(MusicModel.fromJson(jsonDecode(response.body)), isA<MusicModel>());
    });

    test('check if data parser works properly', () async {
      http.Response response = await api.getMusicList(client, query);
      expect(service.parseData(MusicModel.fromJson(jsonDecode(response.body))),
          isA<List<MusicViewModel>>());
    });

    test('check if the result contains audio file', () async {
      http.Response response = await api.getMusicList(client, query);
      expect(
          service
              .parseData(MusicModel.fromJson(jsonDecode(response.body)))[0]
              .musicPreviewPath,
          contains('.m4a'));
    });

    test('check if the result contains the correct album artwork image',
            () async {
          http.Response response = await api.getMusicList(client, query);
          expect(
              service
                  .parseData(MusicModel.fromJson(jsonDecode(response.body)))[0]
                  .imagePath,
              contains('.jpg'));
        });

    test('returns a List of MusicViewModel object if the http call completes',
            () async {
          expect(await service.fetchMusics(client, api, artistName),
              isA<List<MusicViewModel>>());
        });
  });
}