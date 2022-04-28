import '../home/models/job.dart';
import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database {
  // Renombrar createJob() por setJob(), método que podremos usar para crear y editar
  Future<void> setJob(Job job);
  Future<void> deleteJob(Job job);
  Stream<List<Job?>> jobsStream();
}

// Obtener el tiempo actual y convertir el Objeto de tipo DateTime a un String
String documentIdFormCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid});
  final String uid;

  final _service = FirestoreService.instance;

  @override
  Future<void> setJob(Job job) => _service.setData(
        path: APIPath.job(uid, job.id),
        data: job.toMap(),
      );
  @override
  Future<void> deleteJob(Job job) async => _service.deleData(
        path: APIPath.job(
          uid,
          job.id,
        ),
      );

  @override
  Stream<List<Job?>> jobsStream() => _service.collectionStream(
        path: APIPath.jobs(uid),
        builder: (data, documentId) => Job.fromMap(data, documentId),
      );
}
