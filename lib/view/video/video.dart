import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/traveller-36475.appspot.com/o/%D8%AA%D8%B5%D9%88%D9%8A%D8%B1%20%D8%AF%D9%82%D9%8A%D9%82%20%D9%8A%D8%B1%D8%B5%D8%AF%20%D8%B1%D9%88%D8%B9%D8%A9%20%D8%A7%D9%84%D8%B9%D8%A7%D8%B5%D9%85%D8%A9%20%D8%A7%D9%84%D8%A5%D8%AF%D8%A7%D8%B1%D9%8A%D8%A9%20%D8%A7%D9%84%D8%AC%D8%AF%D9%8A%D8%AF%D8%A9%20%E2%9D%A4%EF%B8%8F.mp4?alt=media&token=518821a7-0a3f-422c-993b-4116dde3f8b2'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          controller.play();
        });
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.value.isInitialized
          ? Center(
              child: InkWell(
              onTap: () {
                setState(() {
                  controller.value.isPlaying
                      ? controller.pause()
                      : controller.play();
                });
              },
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            ))
          : Container(),
    );
  }
}
