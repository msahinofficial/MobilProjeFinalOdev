import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Database.dart';
import 'game.dart';

class GameViewModel extends ChangeNotifier {
  String _collectionPath = 'Games';

  Database _database = Database();

  Stream<List<Game>>? getGameList() {
    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getGameListFromApi(_collectionPath)
        .map((querySnapshot) => querySnapshot.docs);

    Stream<List<Game>>? streamListBook = streamListDocument.map(
        (listOfDocSnap) => listOfDocSnap.map((docSnap) => Game.fromMap(docSnap.data()))
            .toList());

    return streamListBook;
  }

  Future<void> deleteBook(Game game) async {
    await _database.deleteDocument(referecePath: _collectionPath, name: game.isim);
  }
}
