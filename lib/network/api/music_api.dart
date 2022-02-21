import 'package:http/http.dart' as http;

class MusicApi {

  final baseUrl = 'https://itunes.apple.com/search?';

  Future<http.Response> getMusicList(http.Client client, String artistName) async {
    http.Response response = await client.get(
        Uri.parse('${baseUrl}country=ID&entity=musicTrack&term=$artistName'));
    return response;
  }

}