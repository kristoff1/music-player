import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_player/pages/home/service/model.dart';
import 'package:music_player/pages/home/view_model.dart';

import '../../../network/api/music_api.dart';

class MusicService {
  bool isAutomatedTesting;

  MusicService({this.isAutomatedTesting = false});

  Future<List<MusicViewModel>> fetchMusics(
    http.Client client,
    MusicApi api,
    String artistName,
  ) async {
    if (isAutomatedTesting) {
      final testResponse = {
        "resultCount": 3,
        "results": [
          {
            "wrapperType": "track",
            "kind": "song",
            "artistId": 909253,
            "collectionId": 1469577723,
            "trackId": 1469577741,
            "artistName": "Jack Johnson",
            "collectionName":
                "Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George",
            "trackName": "Upside Down",
            "collectionCensoredName":
                "Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George",
            "trackCensoredName": "Upside Down",
            "artistViewUrl":
                "https://music.apple.com/us/artist/jack-johnson/909253?uo=4",
            "collectionViewUrl":
                "https://music.apple.com/us/album/upside-down/1469577723?i=1469577741&uo=4",
            "trackViewUrl":
                "https://music.apple.com/us/album/upside-down/1469577723?i=1469577741&uo=4",
            "previewUrl":
                "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/5e/5b/3d/5e5b3df4-deb5-da78-5d64-fe51d8404d5c/mzaf_13341178261601361485.plus.aac.p.m4a",
            "artworkUrl30":
                "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/30x30bb.jpg",
            "artworkUrl60":
                "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/60x60bb.jpg",
            "artworkUrl100":
                "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/100x100bb.jpg",
            "collectionPrice": 9.99,
            "trackPrice": 1.29,
            "releaseDate": "2005-01-01T12:00:00Z",
            "collectionExplicitness": "notExplicit",
            "trackExplicitness": "notExplicit",
            "discCount": 1,
            "discNumber": 1,
            "trackCount": 14,
            "trackNumber": 1,
            "trackTimeMillis": 208643,
            "country": "USA",
            "currency": "USD",
            "primaryGenreName": "Rock",
            "isStreamable": true
          },
          {
            "wrapperType": "track",
            "kind": "song",
            "artistId": 909253,
            "collectionId": 1469577723,
            "trackId": 1469577808,
            "artistName": "Jack Johnson",
            "collectionName":
                "Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George",
            "trackName": "Broken",
            "collectionCensoredName":
                "Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George",
            "trackCensoredName": "Broken",
            "artistViewUrl":
                "https://music.apple.com/us/artist/jack-johnson/909253?uo=4",
            "collectionViewUrl":
                "https://music.apple.com/us/album/broken/1469577723?i=1469577808&uo=4",
            "trackViewUrl":
                "https://music.apple.com/us/album/broken/1469577723?i=1469577808&uo=4",
            "previewUrl":
                "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/8b/fd/81/8bfd81a6-0217-b56c-01b0-7249ed910a35/mzaf_16218415284344588014.plus.aac.p.m4a",
            "artworkUrl30":
                "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/30x30bb.jpg",
            "artworkUrl60":
                "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/60x60bb.jpg",
            "artworkUrl100":
                "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/100x100bb.jpg",
            "collectionPrice": 9.99,
            "trackPrice": 1.29,
            "releaseDate": "2006-02-07T12:00:00Z",
            "collectionExplicitness": "notExplicit",
            "trackExplicitness": "notExplicit",
            "discCount": 1,
            "discNumber": 1,
            "trackCount": 14,
            "trackNumber": 2,
            "trackTimeMillis": 234746,
            "country": "USA",
            "currency": "USD",
            "primaryGenreName": "Rock",
            "isStreamable": true
          },
          {
            "wrapperType": "track",
            "kind": "song",
            "artistId": 909253,
            "collectionId": 1469577723,
            "trackId": 1469577830,
            "artistName": "Jack Johnson",
            "collectionName":
                "Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George",
            "trackName": "We're Going To Be Friends",
            "collectionCensoredName":
                "Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George",
            "trackCensoredName": "We're Going To Be Friends",
            "artistViewUrl":
                "https://music.apple.com/us/artist/jack-johnson/909253?uo=4",
            "collectionViewUrl":
                "https://music.apple.com/us/album/were-going-to-be-friends/1469577723?i=1469577830&uo=4",
            "trackViewUrl":
                "https://music.apple.com/us/album/were-going-to-be-friends/1469577723?i=1469577830&uo=4",
            "previewUrl":
                "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/ce/48/5b/ce485b59-13b7-9859-0431-e602d6347479/mzaf_7168871676263777717.plus.aac.p.m4a",
            "artworkUrl30":
                "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/30x30bb.jpg",
            "artworkUrl60":
                "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/60x60bb.jpg",
            "artworkUrl100":
                "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/100x100bb.jpg",
            "collectionPrice": 9.99,
            "trackPrice": 1.29,
            "releaseDate": "2005-01-01T12:00:00Z",
            "collectionExplicitness": "notExplicit",
            "trackExplicitness": "notExplicit",
            "discCount": 1,
            "discNumber": 1,
            "trackCount": 14,
            "trackNumber": 7,
            "trackTimeMillis": 137533,
            "country": "USA",
            "currency": "USD",
            "primaryGenreName": "Rock",
            "isStreamable": true
          },
        ]
      };
      return parseData(MusicModel.fromJson(testResponse));
    }
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
