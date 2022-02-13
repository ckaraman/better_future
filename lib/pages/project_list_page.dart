import 'package:better_future/pages/detail_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({Key? key}) : super(key: key);

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

CollectionReference ref = FirebaseFirestore.instance.collection('Project');

class _ProjectListPageState extends State<ProjectListPage> {
  int count = 0;
  final String _url =
      'https://static.wikia.nocookie.net/civilization/images/1/15/Hydroelectric_Dam_%28Civ6%29.png/revision/latest?cb=20201203202345';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.data == null) {
            return Text(
              'Herhangi bir ürün bulunamadı',
              style: Theme.of(context).textTheme.headline1,
            );
          }
          if (snapshot.hasData) {
            count = snapshot.data!.docs.length;
            return GridView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                itemBuilder: (context, index) {
                  var docRef = snapshot.data!.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DetailPage()));
                      },
                      child: Card(
                        elevation: 8,
                        child: Column(
                          children: [
                            Expanded(
                                child: Image.network(_url, fit: BoxFit.fill)),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(docRef['projectName']),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
