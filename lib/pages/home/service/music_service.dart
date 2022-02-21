import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_player/pages/home/service/model.dart';
import 'package:music_player/pages/home/view_model.dart';

import '../../../network/api/music_api.dart';

class MusicService {

  Future<List<MusicViewModel>> fetchMusics(
    http.Client client,
    MusicApi api,
    String artistName,
  ) async {
    String query = artistName.replaceAll(' ', '+');
    http.Response response = await api.getMusicList(client, query);
    List<MusicViewModel> musicViewModels =
        parseData(MusicModel.fromJson(jsonDecode(response.body)));
    return musicViewModels;
  }

  List<MusicViewModel> parseData(MusicModel response) {
    return response.results!.map<MusicViewModel>((ResultItem item) {
      return MusicViewModel.parse(item);
    }).toList();
  }
}
