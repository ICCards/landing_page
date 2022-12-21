import 'package:flutter/material.dart';
import 'package:appinio_video_player/appinio_video_player.dart';

class Player extends StatefulWidget {
  final String videoUrl;
  const Player({Key? key, required this.videoUrl}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<Player> createState() => _PlayerState(videoUrl);
}

class _PlayerState extends State<Player> {
  final String videoUrl;
  IconData playIcon = Icons.play_arrow;
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;
  bool _visible = true;
  _PlayerState(this.videoUrl);

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(videoUrl)
      ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: videoPlayerController,
        customVideoPlayerSettings: CustomVideoPlayerSettings(
            showPlayButton: false,
            showDurationPlayed: false,
            showDurationRemaining: false,
            showFullscreenButton: false,
            alwaysShowThumbnailOnVideoPaused: false,
            durationAfterControlsFadeOut: const Duration(seconds: 0),
            controlBarAvailable: false,
            settingsButtonAvailable: false,
            playButton: IconButton(
              onPressed: (() {
                if (!videoPlayerController.value.isPlaying) {
                  videoPlayerController.play();
                  setState(() {
                    playIcon = Icons.pause;
                  });
                } else {
                  videoPlayerController.pause();
                  setState(() {
                    playIcon = Icons.play_arrow;
                  });
                }
              }),
              icon: Icon(playIcon, color: Colors.white.withOpacity(0.6)),
              iconSize: 100,
            )));
    videoPlayerController.setLooping(true);
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 850,
        height: 480,
        child: Stack(
          children: [
            CustomVideoPlayer(
              customVideoPlayerController: _customVideoPlayerController,
            ),
            AnimatedOpacity(
              // If the widget is visible, animate to 0.0 (invisible).
              // If the widget is hidden, animate to 1.0 (fully visible).
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              // The green box must be a child of the AnimatedOpacity widget.
              child: MouseRegion(
                  onExit: (event) {
                    setState(() {
                      _visible = false;
                    });
                  },
                  onEnter: ((event) {
                    setState(() {
                      _visible = true;
                    });
                  }),
                  onHover: (event) {},
                  child: Center(
                    child: IconButton(
                      onPressed: (() {
                        if (!videoPlayerController.value.isPlaying) {
                          videoPlayerController.play();
                          setState(() {
                            playIcon = Icons.pause;
                          });
                        } else {
                          videoPlayerController.pause();
                          setState(() {
                            playIcon = Icons.play_arrow;
                          });
                        }
                      }),
                      icon:
                          Icon(playIcon, color: Colors.white.withOpacity(0.6)),
                      iconSize: 100,
                    ),
                  )),
            ),
          ],
        ));
  }
}
