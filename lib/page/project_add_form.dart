import 'package:better_future/project_image_add.dart';
import 'package:flutter/material.dart';

class ProjectAdd extends StatefulWidget {
  ProjectAdd({Key? key}) : super(key: key);

  @override
  State<ProjectAdd> createState() => _ProjectAddState();
}

class _ProjectAddState extends State<ProjectAdd> {
  final formKey = GlobalKey<FormState>();
  String projectName = '';
  String konu = '';
  String projectIn = '';
  String appbarTitle = "Proje Ekleme Formu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarTitle),
      ),
      body: Form(
        key: formKey,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildsd("Proje Adı", "Proje Adı Giriniz"),
            const SizedBox(height: 32),
            buildsd("Konu", "Konu Giriniz"),
            const SizedBox(height: 32),
            buildsd("Proje Detayı", "Proje Detay Giriniz"),
            const SizedBox(height: 32),
            buildsd("Proje İçin Gereken Bütçe", "Bütçe Giriniz"),
            const SizedBox(height: 32),

            // buildPassword(),
            // const SizedBox(height: 32),
            buildAddImage(),
            buildSubmit(),
          ],
        ),
      ),
    );
  }

  Widget buildsd(String labelText, String errorMessage) => TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          // final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
          //final regExp = RegExp(pattern);

          if (value!.isEmpty) {
            return errorMessage;
          } //else if (!regExp.hasMatch(value)) {
          // return 'Enter a valid email';}
          else {
            return null;
          }
        },
        // onSaved: (value) => setState(() => contents = value!),
      );
  Widget buildAddImage() => ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProjectImage()));
      },
      child: Text("Görsel Ekle"));
  Widget buildSubmit() => Builder(
        builder: (context) => ElevatedButton(
          child: Text('Ekle'),
          onPressed: () {
            final isValid = formKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              formKey.currentState?.save();

              final message =
                  //   'Username: $projectName\nPassword: $projectIn\nEmail: $konu';
                  "Eklendi";
              final snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      );

  /* Widget buildProjectName() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Project Name',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
        ),
        validator: (value) {
          if (value!.length < 4) {
            return 'Proje Adı 4 harften fazla olmalı';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => username = value!),
      );
  Widget buildKonu() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Konu',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
          final regExp = RegExp(pattern);

          if (value!.isEmpty) {
            return 'Konu Giriniz';
          } // else if (!regExp.hasMatch(value)) {
          // return 'Enter a valid email';}
          else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) => setState(() => email = value!),
      );
  Widget buildDocument() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Proje İçeriği',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
          final regExp = RegExp(pattern);

          if (value!.isEmpty) {
            return 'Proje İçeriği Giriniz';
          } //else if (!regExp.hasMatch(value)) {
          // return 'Enter a valid email';}
          else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) => setState(() => email = value!),
      );
*/

  /* Widget buildPassword() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 7) {
            return 'Password must be at least 7 characters long';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => password = value!),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      );
      */

}
