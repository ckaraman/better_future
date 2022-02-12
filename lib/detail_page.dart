import 'package:better_future/constans/text_style.dart';
import 'package:better_future/video_items.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
                child: ListTile(
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Proje Adı", style: kTextStyleTitle),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Afrika'da güneş enerji",
                            style: kTextStyleComment),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Proje Konusu",
                          style: kTextStyleTitle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Afrikada bulunan evime güneş enerjisi koymak istiyorum.",
                            style: kTextStyleComment),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Proje Detayı",
                          style: kTextStyleTitle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Evime güneş enerjisi paneli eklemek için ihtiyacım olan bazı ürünler için yardım istiyorum."
                            "Ürünler: Akü, 20 watt panel, dönüştürücü.",
                            style: kTextStyleComment),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Proje İçin Gerekli Bütçe",
                          style: kTextStyleTitle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Toplam 1000 dolar bütçeye ihtiyacım var",
                            style: kTextStyleComment),
                      ]),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
