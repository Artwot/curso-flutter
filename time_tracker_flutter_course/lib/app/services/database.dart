import '/app/home/models/job.dart';
import '/app/services/api_path.dart';
import '/app/services/firestore_service.dart';
import '../home/models/entry.dart';

abstract class Database {
  // Renombrar createJob() por setJob(), método que podremos usar para crear y editar
  Future<void> setJob(Job job);
  Future<void> deleteJob(Job job);
  Stream<List<Job?>> jobsStream();
  Stream<Job> jobStream({required String jobId});

  Future<void> setEntry(Entry entry);
  Future<void> deleteEntry(Entry entry);
  Stream<List<Entry>> entriesStream({Job? job});
}

// Obtener el tiempo actual y convertir el Objeto de tipo DateTime a un String
String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

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
  Future<void> deleteJob(Job job) async {
    // Eliminar donde entry.jobId == job.jobId
    final allEntries = await entriesStream(job: job)?.first;
    if (allEntries != null) {
      for (Entry entry in allEntries) {
        if (entry.jobId == job.id) {
          await deleteEntry(entry);
        }
      }
    }
    // Eliminar 'job'
    await _service.deleData(path: APIPath.job(uid, job.id));
  }

  @override
  Stream<Job> jobStream({required String jobId}) => _service.documentStream(
        path: APIPath.job(uid, jobId),
        builder: (data, documentId) => Job.fromMap(data, documentId)!,
      );

  @override
  Stream<List<Job?>> jobsStream() => _service.collectionStream(
        path: APIPath.jobs(uid),
        builder: (data, documentId) => Job.fromMap(data, documentId),
      );

  @override
  Future<void> setEntry(Entry entry) => _service.setData(
        path: APIPath.entry(uid, entry.id),
        data: entry.toMap(),
      );

  @override
  Future<void> deleteEntry(Entry entry) =>
      _service.deleData(path: APIPath.entry(uid, entry.id));

  @override
  Stream<List<Entry>> entriesStream({Job? job}) =>
      _service.collectionStream<Entry>(
        path: APIPath.entries(uid),
        queryBuilder: job != null
            ? (query) => query.where('jobId', isEqualTo: job.id)
            : null,
        builder: (data, documentID) => Entry.fromMap(data, documentID),
        sort: (lhs, rhs) => rhs.start.compareTo(lhs.start),
      );
}
