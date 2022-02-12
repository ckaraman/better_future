import 'package:flutter/material.dart';

class MyEducations extends StatefulWidget {
  const MyEducations({Key? key}) : super(key: key);

  @override
  State<MyEducations> createState() => _MyEducationsState();
}

class _MyEducationsState extends State<MyEducations> {
  String appBarTitle = "Eğitimlerim";

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
      body: ListView.builder(
          itemCount: profilList.length,
          itemBuilder: (context, indeks) {
            return SizedBox(
              height: 80,
              child: GestureDetector(
                onTap: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AramaSayfasi()),
                  );*/
                },
                child: Card(
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.cast_for_education,
                          size: 35,
                        ),
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      Text(profilList[indeks]),
                      const Spacer(),
                      const Icon(Icons.arrow_right),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
