import 'package:flutter/material.dart';
import 'package:better_future/constans/text_style.dart';

class Detail_cards extends StatelessWidget {
  String name;
  String explanation;

  Detail_cards({required this.name, required this.explanation});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(name, style: kTextStyleTitle),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(explanation, style: kTextStyleComment),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
