import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title, description;

  CustomDialog({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 100,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ]),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(
              title,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w200),
            ),
            SizedBox(height: 16.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 24.0),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: Text("Okey"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ]),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            radius: 50,
            backgroundImage: AssetImage("assets/tik.png"),
          ),
        )
      ],
    );
  }
}
