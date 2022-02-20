import 'package:music_player/view_model.dart';

import 'model.dart';

List<MusicViewModel> parseData(MusicModel response) {
  return response.results!.map<MusicViewModel>((ResultItem item) {
    return MusicViewModel.parse(item);
  }).toList();
}