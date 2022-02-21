import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/constant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/network/api/music_api.dart';
import 'package:music_player/pages/home/service/model.dart';
import 'package:music_player/pages/home/service/music_service.dart';
import 'package:music_player/pages/home/view_model.dart';

import 'music_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchMusic', () {
    test('returns a Model object if the http call completes', () async {
      File testJson = File('assets/jsons/response_test.json');
      final testResponse = await testJson.readAsString();

      final client = MockClient();
      final MusicService service = MusicService();
      final MusicApi api = MusicApi();

      when(api.getMusicList(client, 'john+mayer'))
          .thenAnswer((_) async => http.Response(testResponse, 200));

      expect(await service.fetchMusics(client, api, 'john mayer'),
          isA<List<MusicViewModel>>());
    });
  });
}
