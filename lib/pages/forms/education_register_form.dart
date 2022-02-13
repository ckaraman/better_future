import 'package:flutter/material.dart';

class EducationRegisterForm extends StatefulWidget {
  const EducationRegisterForm({Key? key}) : super(key: key);

  @override
  State<EducationRegisterForm> createState() => _EducationRegisterFormState();
}

class _EducationRegisterFormState extends State<EducationRegisterForm> {
  final formKey = GlobalKey<FormState>();
  String projectName = '';
  String konu = '';
  String projectIn = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text("Hello Appbar"),
          ),
      body: Form(
        key: formKey,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            buildsd("İsim-Soyisim", "İsim-Soyisim giriniz"),
            const SizedBox(height: 32),
            buildsd("E-mail ", "E-mail adresini giriniz"),
            const SizedBox(height: 32),
            buildsd("Ders Tarihi", "Ders Tarihini giriniz"),
            const SizedBox(height: 32),
            buildsd("Konu Detayı", "Konu detayı giriniz"),
            const SizedBox(height: 32),

            // buildPassword(),
            // const SizedBox(height: 32),

            buildSubmit(),
          ],
        ),
      ),
    );
  }

  Widget buildsd(String labelText, String errorMessage) => TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
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
      );

  Widget buildSubmit() => Builder(
        builder: (context) => ElevatedButton(
          child: const Text('Eğitime Kayıt Ol'),
          onPressed: () {
            final isValid = formKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              formKey.currentState?.save();

              const message =
                  //   'Username: $projectName\nPassword: $projectIn\nEmail: $konu';
                  "Eklendi";
              const snackBar = SnackBar(
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
