import 'package:better_future/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class Detail_cards extends StatelessWidget {
  final String projectName;

  final String projectSubject;

  const Detail_cards({
    required this.projectName,
    required this.projectSubject,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Build_Text(
              string: "Proje Adı",
              colors: Colors.black,
              fontsize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Build_Text(
                fontsize: 12,
                colors: const Color.fromARGB(255, 82, 82, 82),
                string: projectName,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(indent: 10, endIndent: 10, height: 15, thickness: 2.0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Build_Text(
              string: "Proje Konusu",
              colors: Colors.black,
              fontsize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Build_Text(
                fontsize: 12,
                colors: const Color.fromARGB(255, 82, 82, 82),
                string: projectSubject,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
