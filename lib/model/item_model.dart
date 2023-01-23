// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'game.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getExpertList(String referencePath) {
    return _firestore.collection(referencePath).snapshots();
  }
}

class ExpertViewModel extends ChangeNotifier {
  final String _collectionPath = 'Games';
  final Database _database = Database();

  Stream<List<Game>> getGameList() {
    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getExpertList(_collectionPath)
        .map((querySnapshot) => querySnapshot.docs);

    Stream<List<Game>> streamListGame = streamListDocument.map(
        (listOfDocSnap) => listOfDocSnap
            .map((docSnap) => Game.fromMap(docSnap.data()))
            .toList());

    return streamListGame;
  }
}
