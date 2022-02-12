import 'package:better_future/Custom_dialog.dart';
import 'package:better_future/Detail_cards.dart';
import 'package:better_future/constans/text_style.dart';
import 'package:better_future/video_items.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:better_future/detail_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: VideoItems(
                    videoPlayerController:
                        VideoPlayerController.asset("assets/video_1.mp4"),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 219, 219, 219),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 219, 219, 219),
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
                              Center(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.grey,
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
                                    child: Text("BAĞIŞ YAP",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 21))),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
