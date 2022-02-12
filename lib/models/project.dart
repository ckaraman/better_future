import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  String id;
  String projectName;
  String projectSubject;
  String image;
  bool giveMoney;
  bool giveResource;

  Project(
      {required this.id,
      required this.projectName,
      required this.projectSubject,
      required this.image,
      required this.giveMoney,
      required this.giveResource});

  factory Project.fromSnapshot(DocumentSnapshot snapshot) {
    return Project(
        id: snapshot.id,
        projectName: snapshot['projectName'],
        projectSubject: snapshot['projectSubject'],
        image: snapshot['image'],
        giveMoney: snapshot['giveMoney'],
        giveResource: snapshot['giveResource']);
  }
}
