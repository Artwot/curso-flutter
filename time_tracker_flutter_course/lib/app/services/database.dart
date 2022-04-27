import '../home/models/job.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'api_path.dart';

abstract class Database {
  Future<void> createJob(Job job);
  void readJobs();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid});
  final String uid;

  Future<void> createJob(Job job) => _setData(
        path: APIPath.job(uid, 'job_abc'),
        data: job.toMap(),
      );

  void readJobs() {
    final path = APIPath.jobs(uid);
    final reference = FirebaseFirestore.instance.collection(path);
    // Podemos usar Streams para leer datos y actualizar la UI cada que cambia
    // la bd en FireStore
    final snapshots = reference.snapshots();
    snapshots.listen((snapshot) {
      snapshot.docs.forEach((snapshot) => print(snapshot.data()));
    });
  }

  // _setData define un solo punto de entrada para todas las inserciones a Firestore
  Future<void> _setData({String? path, Map<String, dynamic>? data}) async {
    final reference = FirebaseFirestore.instance.doc(path!);
    print('$path: $data');
    await reference.set(data!);
  }
}
