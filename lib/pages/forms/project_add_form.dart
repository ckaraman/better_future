import 'package:better_future/models/notification_settings_model.dart';
import 'package:better_future/widgets/project_image_add.dart';
import 'package:better_future/widgets/project_video_add.dart';
import 'package:better_future/services/project_service.dart';
import 'package:flutter/material.dart';

class ProjectAdd extends StatefulWidget {
  const ProjectAdd({Key? key}) : super(key: key);

  @override
  State<ProjectAdd> createState() => _ProjectAddState();
}

class _ProjectAddState extends State<ProjectAdd> {
  final ProjectService _projectService = ProjectService();
  final formKey = GlobalKey<FormState>();
  final TextEditingController projectName = TextEditingController();
  final TextEditingController projectSubject = TextEditingController();
  final TextEditingController image = TextEditingController();
  bool giveMoney = false;
  bool giveResource = false;

  String appbarTitle = "Proje Ekleme Formu";
  double sizedBoxHeight = 12;

  get onChanged => null;

  final notifications = [
    NotificationSetting(title: 'Maddi Yardıma İhtiyacım var'),
    NotificationSetting(title: 'Hammadde Yardımına İhtiyacım Var'),
  ];

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
          padding: const EdgeInsets.all(16),
          children: [
            buildTextFormField("Proje Adı", "Proje Adı Giriniz", projectName),
            SizedBox(height: sizedBoxHeight),
            buildTextFormField("Konu", "Konu Giriniz", projectSubject),
            SizedBox(height: sizedBoxHeight),

            // buildTextFormField("Proje İçin Gereken Bütçe", "Bütçe Giriniz",),
            SizedBox(height: sizedBoxHeight),

            //const Divider(),
            CheckboxListTile(
              title: const Text("Parasal Destek! "),
              value: giveMoney,
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.red,
              activeColor: Colors.deepPurple,
              onChanged: (bool? val) {
                setState(() {
                  giveMoney = val!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Hammade veya Proje Yardımı"),
              value: giveResource,
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.red,
              activeColor: Colors.deepPurple,
              onChanged: (bool? val) {
                setState(() {
                  giveResource = val!;
                });
              },
            ),

            buildAddImage(),

            buildAddVideo(),

            buildSubmit(),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField(
          String labelText, String errorMessage, controller) =>
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
              color: Theme.of(context).inputDecorationTheme.labelStyle!.color),
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
        // onSaved: (value) => setState(() => contents = value!),
      );

  Widget buildAddImage() => ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProjectImage()));
      },
      child: const Text("Fotoğraf Ekle"));

  Widget buildAddVideo() => ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProjectVideo()));
      },
      child: const Text("Video Ekle"));

  Widget buildSubmit() => Builder(
        builder: (context) => ElevatedButton(
          child: const Text('Ekle'),
          onPressed: () {
            final isValid = formKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              formKey.currentState?.reset();
              ProjectService().addProject(
                  projectName.text.trim(),
                  projectSubject.text.trim(),
                  image.text.trim(),
                  giveMoney,
                  giveResource);

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
