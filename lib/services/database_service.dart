import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Task>> getTasks() {
    return _db.collection('tasks')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Task.fromMap(doc.data(), doc.id))
        .toList());
  }

  Future<void> addTask(Task task) async {
    DocumentReference docRef = await _db.collection('tasks').add({
      ...task.toMap(),
      'createdAt': FieldValue.serverTimestamp(),
    });

    await docRef.update({'id': docRef.id});
  }

  Future<void> updateTask(Task task) async {
    await _db.collection('tasks').doc(task.id).update(task.toMap());
  }

  Future<void> deleteTask(String id) async {
    await _db.collection('tasks').doc(id).delete();
  }
}
