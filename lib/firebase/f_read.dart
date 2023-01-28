// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('year1');

class FirebaseRead {
  static Stream<QuerySnapshot> readList() {
    CollectionReference notesItemCollection = _collection;

    return notesItemCollection.snapshots();
  }
}
