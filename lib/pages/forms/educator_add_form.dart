import 'package:better_future/models/energy_models.dart';
import 'package:better_future/widgets/project_image_add.dart';
import 'package:flutter/material.dart';

class EducatorAdd extends StatefulWidget {
  const EducatorAdd({Key? key}) : super(key: key);

  @override
  State<EducatorAdd> createState() => _EducatorAddState();
}

class _EducatorAddState extends State<EducatorAdd> {
  final formKey = GlobalKey<FormState>();
  String projectName = '';
  String konu = '';
  String projectIn = '';
  String appBarTitle = "Eğitmen Kayıt Formu";
  double sizedBoxHeight = 12;

  final List<Energys> _companies = Energys.getCompanies();
  late List<DropdownMenuItem<Energys>> _dropdownMenuItems;
  late Energys _selectedCompany;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value!;
    super.initState();
  }

  List<DropdownMenuItem<Energys>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Energys>> items = [];
    for (Energys company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  void onChangeDropdownItem(Energys? selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany!;
    });
  }

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
          padding: const EdgeInsets.all(16),
          children: [
            buildAddPhoto(),
            SizedBox(height: sizedBoxHeight),

            buildsd("Name-Surname", "Name-Surname Giriniz"),
            SizedBox(height: sizedBoxHeight),
            buildsd("Yaşınız", "Yaş Giriniz"),
            SizedBox(height: sizedBoxHeight),
            buildsd("E-Mail", "E-Mail Giriniz"),
            SizedBox(height: sizedBoxHeight),
            buildDropDown(),
            SizedBox(height: sizedBoxHeight),
            buildsd("Hangi Günler Eğitim Verebilirsiniz?",
                "Telefon Numarası Giriniz"),
            SizedBox(height: sizedBoxHeight),
            buildsd("Eğitimden gelir bekliyor musunuz?",
                "İstemiyorsanız - bırakınız"),

            SizedBox(height: sizedBoxHeight),
            buildSubmit(),
            // buildPassword(),
            // const SizedBox(height: 32),
            // buildAddImage(),
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
        // onSaved: (value) => setState(() => contents = value!),
      );

  Widget buildAddImage() => ElevatedButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProjectImage()));
      },
      child: const Text("Fotoğraf Ekle"));

  Widget buildAddPhoto() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProjectImage()));
            },
            child: const SizedBox(
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
          child: const Text('Ekle'),
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
                backgroundColor: Color.fromARGB(255, 64, 68, 64),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      );

  Widget buildDropDown() => DropdownButton(
        value: _selectedCompany,
        items: _dropdownMenuItems,
        onChanged: onChangeDropdownItem,
      );
}
