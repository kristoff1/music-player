import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_player/component/list_item.dart';
import 'package:music_player/component/player_view.dart';
import 'package:music_player/component/search_view_component.dart';
import 'package:music_player/pages/home/view_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_player/util/injector.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  ///Audio initiator
  AudioPlayer audioPlayer = AudioPlayer();

  int _selectedTrackIndex = -1;

  MusicViewModel? _selectedTrack;

  Timer? _debounceTimer;

  List<MusicViewModel> _listModels = [];

  @override
  void initState() {
    _controller.addListener(_onSearchChange);
    super.initState();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _controller.removeListener(_onSearchChange);
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _selectedTrack != null
          ? PlayerView(
              key: const Key('PlayerView'),
              musicProgressListener: audioPlayer.onAudioPositionChanged,
              musicPlayerState: audioPlayer.onPlayerStateChanged,
              duration: _selectedTrack?.trackLength,
              onNextTrackClicked: _nextTrackClicked,
              onPlayClicked: _playClicked,
              onPauseClicked: _pauseClicked,
              onPreviousTrackClicked: _previousTrackClicked,
            )
          : null,
      appBar: AppBar(
        title: SearchViewComponent(
          _controller,
          key: const Key('SearchView'),
        ),
      ),
      body: _listModels.isNotEmpty
          ? ListView.builder(
              key: const Key('MusicList'),
              itemCount: _listModels.length,
              itemBuilder: (BuildContext context, int index) {
                return ListItemComponent(
                    key: Key('Item$index'),
                    isSelected: index == _selectedTrackIndex,
                    onSelected: () {
                      _playAudio(index, _listModels[index]);
                    },
                    musicViewModel: _listModels[index]);
              })
          : const Center(
              key: Key('InitialView'),
              child: Text('Search Artist to Load Musics'),
            ),
    );
  }

  void _playAudio(int index, MusicViewModel musicViewModel) {
    audioPlayer.play(musicViewModel.musicPreviewPath);
    setState(() {
      _selectedTrack = musicViewModel;
      _selectedTrackIndex = index;
    });
  }

  void _nextTrackClicked() {
    if (_selectedTrackIndex == _listModels.length - 1) {
      _playAudio(0, _listModels[0]);
    } else {
      _playAudio(_selectedTrackIndex + 1, _listModels[_selectedTrackIndex + 1]);
    }
  }

  void _playClicked() {
    _playAudio(_selectedTrackIndex, _listModels[_selectedTrackIndex]);
  }

  void _pauseClicked() {
    audioPlayer.pause();
  }

  void _previousTrackClicked() {
    if (_selectedTrackIndex == 0) {
      _playAudio(_listModels.length - 1, _listModels[_listModels.length - 1]);
    } else {
      _playAudio(_selectedTrackIndex - 1, _listModels[_selectedTrackIndex - 1]);
    }
  }

  void _onSearchChange() {
    InheritedInjection.of(context).logicHelper.debounce(
          actionTimer: _debounceTimer,
          actionAfterDelay: () {
                  InheritedInjection.of(context)
                      .musicService
                      .fetchMusics(
                        InheritedInjection.of(context).httpClient,
                        InheritedInjection.of(context).musicApi,
                        _controller.text,
                      )
                      .then((List<MusicViewModel> models) {
                    setState(() {
                      _listModels = models;
                    });
                  });
                },
        );
  }
}
