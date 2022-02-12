import 'package:better_future/project_image_add.dart';
import 'package:flutter/material.dart';

class EducatorAdd extends StatefulWidget {
  EducatorAdd({Key? key}) : super(key: key);

  @override
  State<EducatorAdd> createState() => _EducatorAddState();
}

class _EducatorAddState extends State<EducatorAdd> {
  final formKey = GlobalKey<FormState>();
  String projectName = '';
  String konu = '';
  String projectIn = '';
  String appBarTitle = "Eğitmen Kayıt Formu";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Form(
        key: formKey,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildAddPhoto(),
            const SizedBox(height: 16),
            buildsd("Name-Surname", "Name-Surname Giriniz"),
            const SizedBox(height: 16),

            buildsd("Yaşınız", "Yaş Giriniz"),
            const SizedBox(height: 16),
            buildsd("Hangi Alanda Eğitim Vermek İstiyorsunuz?", "Konu Giriniz"),
            const SizedBox(height: 16),
            buildsd("Proje Detayı", "Proje Detay Giriniz"),
            const SizedBox(height: 16),
            buildsd("Proje İçin Gereken Bütçe", "Bütçe Giriniz"),
            const SizedBox(height: 16),

            // buildPassword(),
            // const SizedBox(height: 32),
            // buildAddImage(),
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
      child: Text("Fotoğraf Ekle"));

  Widget buildAddPhoto() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProjectImage()));
            },
            child: Container(
              width: 80.0,
              height: 80.0,
              child: CircleAvatar(
                child: Icon(
                  Icons.camera_alt,
                ),
              ),
            ),
          ),
        ],
      );
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
}
