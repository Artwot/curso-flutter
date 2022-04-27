import '../home/models/job.dart';
import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database {
  Future<void> createJob(Job job);
  Stream<List<Job?>> jobsStream();
}

// Obtener el tiempo actual y convertir el Objeto de tipo DateTime a un String
String documentIdFormCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid});
  final String uid;

  final _service = FirestoreService.instance;

  Future<void> createJob(Job job) => _service.setData(
        path: APIPath.job(uid, documentIdFormCurrentDate()),
        data: job.toMap(),
      );

  Stream<List<Job?>> jobsStream() => _service.collectionStream(
        path: APIPath.jobs(uid),
        builder: (data) => Job.fromMap(data),
      );
}
