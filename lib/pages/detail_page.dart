import 'package:better_future/widgets/custom_dialog.dart';
import 'package:better_future/widgets/detail_cards.dart';
import 'package:better_future/constans/text_style.dart';
import 'package:better_future/widgets/video_items.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 250,
                child: VideoItems(
                  videoPlayerController:
                      VideoPlayerController.asset("assets/video_1.mp4"),
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Detail_cards(
                              projectSubject:
                                  "Evime g??ne?? enerjisi paneli eklemek i??in ihtiyac??m olan baz?? ??r??nler i??in yard??m istiyorum."
                                  "??r??nler: Ak??, 20 watt panel, d??n????t??r??c??.",
                              projectName: "Afrika'da g??ne?? enerji"),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xff176ADE),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => const CustomDialog(
                                          title: "Ba??ar??l??",
                                          description:
                                              "Ba?????? yapt??????n??z i??in te??ekk??r ederiz",
                                        ));
                              },
                              child: Text("BA??I?? YAP", style: kTextStyleTitle),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
