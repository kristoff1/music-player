import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayerView extends StatefulWidget {
  final Stream<Duration> musicProgressListener;

  final Stream<PlayerState> musicPlayerState;

  final int? duration;

  final Function() onPlayClicked;

  final Function() onPauseClicked;

  final Function() onPreviousTrackClicked;

  final Function() onNextTrackClicked;

  PlayerView({
    required this.musicProgressListener,
    required this.musicPlayerState,
    required this.onPlayClicked,
    required this.onPauseClicked,
    required this.onNextTrackClicked,
    required this.onPreviousTrackClicked,
    required this.duration,
  });

  @override
  State<StatefulWidget> createState() {
    return PlayerViewState();
  }
}

class PlayerViewState extends State<PlayerView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: widget.onPreviousTrackClicked,
                child: const Icon(
                  Icons.fast_rewind,
                  size: 40,
                ),
              ),
              StreamBuilder<PlayerState>(
                  stream: widget.musicPlayerState,
                  builder: (BuildContext context,
                      AsyncSnapshot<PlayerState> snapshot) {
                    print('Current State ${snapshot.data.toString()}');
                    if (!snapshot.hasData) {
                      return GestureDetector(
                        child: const Icon(Icons.pause),
                        onTap: widget.onPauseClicked,
                      );
                    }else if (snapshot.data == PlayerState.PLAYING) {
                      return GestureDetector(
                        child: const Icon(Icons.pause),
                        onTap: widget.onPauseClicked,
                      );
                    } else if (snapshot.data == PlayerState.COMPLETED) {
                      return GestureDetector(
                        child: const Icon(Icons.play_arrow),
                        onTap: widget.onPlayClicked,
                      );
                    } else {
                      return GestureDetector(
                        child: const Icon(Icons.play_arrow),
                        onTap: widget.onPlayClicked,
                      );
                    }
                  }),
              GestureDetector(
                onTap: widget.onNextTrackClicked,
                child: const Icon(
                  Icons.fast_forward,
                  size: 40,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
            child: StreamBuilder<Duration>(
              stream: widget.musicProgressListener,
              initialData: const Duration(milliseconds: 0),
              builder:
                  (BuildContext context, AsyncSnapshot<Duration> snapshot) {
                if (!snapshot.hasData) {
                  return const LinearProgressIndicator(
                    value: 0,
                  );
                } else if (snapshot.hasData) {
                  print('Duration Stream ${snapshot.data.toString()}');
                  return LinearProgressIndicator(
                    value: snapshot.data!.inMilliseconds / widget.duration!,
                  );
                } else {
                  return const LinearProgressIndicator(
                    value: 0,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
