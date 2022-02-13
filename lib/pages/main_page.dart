import 'package:better_future/pages/educations_page.dart';
import 'package:better_future/pages/forms/educator_add_form.dart';
import 'package:better_future/pages/login_page.dart';
import 'package:better_future/pages/myEducations_page.dart';
import 'package:better_future/pages/myProjects_page.dart';
import 'package:better_future/pages/forms/project_add_form.dart';
import 'package:better_future/pages/project_list_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

CollectionReference ref = FirebaseFirestore.instance.collection('Project');

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DefaultTabController(
        length: 2, // length of tabs
        initialIndex: 0,

        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: 'Projeler'),
                  Tab(text: 'Eğitimler'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    ProjectListPage(),
                    EducationsPage(),
                  ],
                ),
              ),
            ]),
      ),
      drawer: buildDrawer(context),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Ahmet"),
            accountEmail: Text("ahmet@gmail.com"),
            currentAccountPicture: CircleAvatar(
                //backgroundImage: AssetImage("assets/images/beyaz.png"),
                ),
          ),
          ListTile(
            title: const Text('Giriş Yap'),
            leading: const Icon(Icons.door_back_door_outlined),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          ),
          ListTile(
            title: const Text('Proje Ekle'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProjectAdd()));
            },
          ),
          ListTile(
            title: const Text('Eğitmen Ol'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EducatorAdd()));
            },
            leading: const Icon(Icons.person),
          ),
          ListTile(
            title: const Text('Eğitimlerim'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyEducations()));
            },
            leading: const Icon(Icons.person),
          ),
          ListTile(
            title: const Text('Projelerim'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyProjects()));
            },
            leading: const Icon(Icons.person),
          ),
          const Divider(),
          ListTile(
            title: const Text('Çıkış yap'),
            onTap: () {
              //  _authService.signOut();
              Navigator.pop(context);
            },
            leading: const Icon(Icons.remove_circle),
          ),
        ],
      ),
    );
  }
}
