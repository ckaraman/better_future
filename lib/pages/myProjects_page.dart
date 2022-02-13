import 'package:flutter/material.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  String appBarTitle = "Projelerim";
  final String _url =
      "https://www.eltech.com.tr/wp-content/uploads/2019/04/solar-panel.png";

  @override
  Widget build(BuildContext context) {
    var profilList = [
      "Projelerim",
      "Projelerim",
      "Projelerim",
      "Projelerim",
      "Projelerim ",
      "Projelerim",
      "Projelerim",
      "Projelerim",
      "Projelerim",
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
                    const Text("Güneş Enerjisi"),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
