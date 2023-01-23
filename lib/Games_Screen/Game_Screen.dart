import 'dart:html';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GameScreen extends StatefulWidget {
  String image;
  GameScreen(this.image);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  CollectionReference coll = FirebaseFirestore.instance.collection("Games");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/${widget.image}.jpeg"),
                        opacity: 0.75)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 35, horizontal: 10),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.cyan,
                      size: 28,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.image,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("PG-18", style: Texts.texts),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Action",
                      style: Texts.texts,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Oyunun fiyati ",
                      style: Texts.texts,
                    )
                  ],
                ),
                SizedBox(width: 10),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 25,
                  unratedColor: Colors.cyan,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                SizedBox(
                  height: 20,
                ),
                Text("EPIC FİYATI = 40TL\nSTEAM FİYATI = 40TL",
                  style: lowTexts.ltext,
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Material(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {
                DocumentReference veriYolu = FirebaseFirestore.instance
                    .collection("Games")
                    .doc(widget.image.toString());
                Map<String, dynamic> oyunlar = {
                  "isim": widget.image.toString(),
                  "yayinci": "Steam",
                  "kategori": "Online",
                  "rate": "8",
                };
                print(widget.image);
                veriYolu.set(oyunlar);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(children: [
                  Icon(
                    Icons.favorite,
                    size: 30,
                    color: Colors.cyan,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Add to wishlits", style: Texts.texts)
                ]),
              ),
            ),
          ),
          Material(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              onTap: () {},
              child: Container(
                  padding: EdgeInsets.all(7),
                  child: Icon(
                    Icons.add_shopping_cart_outlined,
                    size: 50,
                    color: Colors.cyan,
                  )),
            ),
          )
        ]),
      ),
    );
  }
}

class Texts {
  static TextStyle texts = const TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}

class lowTexts {
  static TextStyle ltext = const TextStyle(
    color: Colors.black,
    fontSize: 18,
  );
}
