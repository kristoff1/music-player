import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_player/model.dart';
import 'package:music_player/repository.dart';
import 'package:music_player/view_model.dart';

class NetworkHelper {
  final baseUrl = 'https://itunes.apple.com/search?';

  Future<List<MusicViewModel>> fetchMusics(String artistName) async {
    http.Response response = await http.get(
        Uri.parse('${baseUrl}country=ID&entity=musicTrack&term=$artistName'));
    List<MusicViewModel> musicViewModels = parseData(MusicModel.fromJson(jsonDecode(response.body)));
    return musicViewModels;
  }
}
