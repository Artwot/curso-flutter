import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService._(); // Constructor de tipo privado
  static final instance = FirestoreService._();

  // _setData define un solo punto de entrada para todas las inserciones a Firestore
  Future<void> setData({String? path, Map<String, dynamic>? data}) async {
    final reference = FirebaseFirestore.instance.doc(path!);
    print('$path: $data');
    await reference.set(data!);
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data) builder,
  }) {
    final reference = FirebaseFirestore.instance.collection(path);
    // Podemos usar Streams para leer datos y actualizar la UI cada que cambia
    // la bd en FireStore
    final snapshots = reference.snapshots();
    return snapshots.map(
      (snapshot) =>
          snapshot.docs.map((snapshot) => builder(snapshot.data())).toList(),
    );
  }
}
