import 'package:better_future/Custom_dialog.dart';
import 'package:better_future/Detail_cards.dart';
import 'package:better_future/constans/text_style.dart';
import 'package:better_future/video_items.dart';
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
            Container(
              height: 250,
              child: VideoItems(
                videoPlayerController:
                    VideoPlayerController.asset("assets/video_1.mp4"),
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
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
                          Detail_cards(
                              name: "Proje Adı",
                              explanation: "Afrika'da güneş enerji"),
                          Detail_cards(
                              name: "Proje Konusu",
                              explanation:
                                  "Afrikada ki evime güneş enerjisi yapmak istiyorum."),
                          Detail_cards(
                              name: "Proje Detayı",
                              explanation:
                                  "Evime güneş enerjisi paneli eklemek için ihtiyacım olan bazı ürünler için yardım istiyorum."
                                  "Ürünler: Akü, 20 watt panel, dönüştürücü."),
                          Detail_cards(
                              name: "Proje İçin Gerekli Bütçe",
                              explanation:
                                  "Toplam 1000 dolar bütçeye ihtiyacım var"),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => CustomDialog(
                                          title: "Başarılı",
                                          description:
                                              "Bağış yaptığınız için teşekkür ederiz",
                                        ));
                              },
                              child: Text("BAĞIŞ YAP", style: kTextStyleTitle),
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
