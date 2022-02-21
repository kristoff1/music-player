import 'package:http/http.dart' as http;
import 'package:music_player/constant.dart';

class MusicApi {

  Future<http.Response> getMusicList(http.Client client, String artistName) async {
    http.Response response = await client.get(
        Uri.parse('${baseUrl}search?country=ID&entity=musicTrack&term=$artistName'));
    return response;
  }

}