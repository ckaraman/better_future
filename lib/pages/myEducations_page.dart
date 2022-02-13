import 'package:flutter/material.dart';

class MyEducations extends StatefulWidget {
  const MyEducations({Key? key}) : super(key: key);

  @override
  State<MyEducations> createState() => _MyEducationsState();
}

class _MyEducationsState extends State<MyEducations> {
  String appBarTitle = "Eğitimlerim";
  final String _url = "https://wallpaperaccess.com/full/1663640.jpg";

  @override
  Widget build(BuildContext context) {
    var profilList = [
      "Eğitim1",
      "Eğitim2",
      "Eğitim3",
      "Eğitim4",
      "Eğitim5 ",
      "Eğitim1",
      "Eğitim1",
      "Eğitim1",
      "Eğitim1",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: GridView.builder(
          shrinkWrap: true,
          itemCount: 5,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1 / 1.3),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: Image.network(_url, fit: BoxFit.fill)),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("Güneş Enerjisi Başlangıç Eğitimi"),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
