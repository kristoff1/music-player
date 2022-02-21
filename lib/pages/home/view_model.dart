import 'service/model.dart';

class MusicViewModel {
  String title;

  String artistName;

  String albumName;

  String imagePath;

  String musicPreviewPath;

  int trackLength;

  MusicViewModel(this.title, this.artistName, this.imagePath,
      this.musicPreviewPath, this.albumName, this.trackLength);

  MusicViewModel.parse(ResultItem item)
      : title = item.trackName ?? '',
        artistName = item.artistName ?? '',
        imagePath = item.artworkUrl60 ?? '',
        musicPreviewPath = item.previewUrl ?? '',
        albumName = item.collectionName ?? '',
        trackLength = item.trackTimeMillis ?? 1;
}
