import 'package:better_future/models/project.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Project> addProject(
    String projectName,
    String projectSubject,
    String image,
    bool giveMoney,
    bool giveResource,
  ) async {
    var ref = _firestore.collection('Project');

    var documentRef = await ref.add({
      'projectName': projectName,
      'projectSubject': projectSubject,
      'image': image,
      'giveMoney': giveMoney,
      'giveResource': giveResource
    });
    return Project(
        id: documentRef.id,
        projectName: projectName,
        projectSubject: projectSubject,
        image: image,
        giveMoney: giveMoney,
        giveResource: giveResource);
  }
}
