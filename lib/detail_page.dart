import 'package:better_future/video_items.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solar System"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Card(
              child: Column(children: [Text("Selam")]),
              color: Colors.red,
            ),
            Expanded(
              child: Container(
                child: VideoItems(
                  videoPlayerController:
                      VideoPlayerController.asset("assets/video_1.mp4"),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.white,
            )),
          ],
        ),
      ),
    );
  }
}
