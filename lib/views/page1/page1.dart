import 'dart:async';

import 'package:flutter/material.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:landing_page/common/Colors.dart';
import 'package:landing_page/common/custom_icon.dart';
import 'package:landing_page/views/video_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;
  String bg =
      "https://faefolk.nyc3.cdn.digitaloceanspaces.com/Media/Videos/overworld.mov";
  String cave =
      "https://faefolk.nyc3.cdn.digitaloceanspaces.com/Media/Videos/cave.mp4";
  String textLogo = "images/text_logo.png";

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(bg)
      ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: videoPlayerController,
        customVideoPlayerSettings: const CustomVideoPlayerSettings(
            showPlayButton: false,
            showDurationPlayed: false,
            showDurationRemaining: false,
            showFullscreenButton: false,
            alwaysShowThumbnailOnVideoPaused: false,
            durationAfterControlsFadeOut: Duration(seconds: 0),
            controlBarAvailable: false,
            settingsButtonAvailable: false));
    videoPlayerController.setLooping(true);
    Timer(const Duration(milliseconds:500 ), () {
      videoPlayerController.play();
    });
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          CustomVideoPlayer(
            customVideoPlayerController: _customVideoPlayerController,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: thirdColor,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  height: 35,
                  width: 40,
                  child: IconButton(
                      color: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      iconSize: 25,
                      onPressed: (() {}),
                      icon: const FaIcon(FontAwesomeIcons.twitter)),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                Container(
                  decoration: BoxDecoration(
                      color: thirdColor,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  height: 35,
                  width: 40,
                  child: IconButton(
                      color: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      iconSize: 25,
                      onPressed: (() {}),
                      icon: const Icon(discord)),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                Container(
                  decoration: BoxDecoration(
                      color: thirdColor,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  height: 35,
                  width: 40,
                  child: IconButton(
                      color: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      iconSize: 25,
                      onPressed: (() {}),
                      icon: const Icon(medium_m)),
                ),
              ],
            ),
          ),
          Center(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.symmetric(vertical: 100)),
                  Image(
                    image: AssetImage(textLogo),
                    width: 600,
                    fit: BoxFit.fill,
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
                  Player(
                    videoUrl: cave,
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 25)),
                  SizedBox(
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: secondaryColor,
                        elevation: 20,
                        side: BorderSide(color: thirdColor, width: 5),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Play Now',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ), // <-- Text
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            // <-- Icon
                            Icons.videogame_asset,
                            size: 45.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
