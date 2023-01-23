import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/game.dart';

class Database {
  FirebaseFirestore  _firestore = FirebaseFirestore.instance;

  /// Firestore servisinden kitapların verisini stream olarak alıp sağlamak

  Stream<QuerySnapshot> getGameListFromApi(String referencePath) {
    return _firestore.collection(referencePath).snapshots();
  }

  /// Firestore üzerindeki bir veriyi silme hizmeti
  Future<void> deleteDocument(
      {required String referecePath, String? name}) async {
    await _firestore.collection(referecePath).doc(name).delete();
  }

  /// firestore'a yeni veri ekleme ve güncelleme hizmeti
  Future<void> setGameData(
      {String? collectionPath, Map<String, dynamic>? bookAsMap}) async {
    await _firestore
        .collection(collectionPath!)
        .doc(Game.fromMap(bookAsMap!).name)
        .set(bookAsMap);
  }
}
