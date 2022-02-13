import 'package:flutter/material.dart';

class Build_Text extends StatelessWidget {
  String string;
  double fontsize;
  Color colors;
  FontWeight fontWeight;
  Build_Text({
    Key? key,
    required this.fontWeight,
    required this.fontsize,
    required this.colors,
    required this.string,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      string,
      style: TextStyle(
        fontSize: fontsize,
        color: colors,
        fontWeight: fontWeight,
      ),
    );
  }
}
