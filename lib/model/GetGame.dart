import 'dart:html';
import 'package:dosya/screens/mainscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GetGame extends StatefulWidget {
  const GetGame({super.key});

  @override
  State<GetGame> createState() => _GetGameState();
}

class _GetGameState extends State<GetGame> {
  final FirebaseFirestore _database = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final CollectionReference gameCol = _database.collection("Users");
    final CollectionReference gameDoc = gameCol.doc().collection("WishList");
    return Padding(
      padding: EdgeInsets.all(10),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
              stream: gameDoc.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> asyncSnapshot){
                List<DocumentSnapshot> gameList = asyncSnapshot.data!.docs;
                return Flexible(child: ListView.builder(itemCount: gameList.length,
                itemBuilder: ((context, index) {
                  var veri = gameList[index].data() as Map<String, dynamic>;
                  return Column(
                    children: [
                      Card(
                      child: Text("Epic Fiyat: " + veri["Epic"]),
                    ),
                    Card(
                      child: Text("Epic Fiyat: " + veri["Steam"]),
                    )
                    ]
                    
                  );
                })));
              },
            )
            ],
          ),
        )
      ),
    );
  }
}