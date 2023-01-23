import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: const FirebaseCrud(),
  ));
}

class FirebaseCrud extends StatefulWidget {
  const FirebaseCrud({super.key});

  @override
  State<FirebaseCrud> createState() => _FirebaseCrudState();
}

class _FirebaseCrudState extends State<FirebaseCrud> {
  String? ad, category, rate, publisher;

  adAl(ad) {
    this.ad = ad;
  }

  categoryAl(category) {
    this.category = category;
  }

  rateAl(rate) {
    this.rate = rate;
  }

  publisherAl(publisher) {
    this.publisher = publisher;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase CRUD islemleri"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                onChanged: (String adeger) {
                  adAl(adeger);
                },
                decoration: InputDecoration(
                    labelText: "Oyun Adı",
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                onChanged: (String cdeger) {
                  categoryAl(cdeger);
                },
                decoration: InputDecoration(
                    labelText: "Kategori",
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                onChanged: (String rdeger) {
                  rateAl(rdeger);
                },
                decoration: InputDecoration(
                    labelText: "Puanla",
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                onChanged: (String pdeger) {
                  publisherAl(pdeger);
                },
                decoration: InputDecoration(
                    labelText: "Yayıncı",
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        veriEkle();
                      },
                      child: const Text("Ekle")),
                  ElevatedButton(
                    onPressed: () {
                      veriSil();
                    },
                    child: const Text("Sil"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      veriGuncelle();
                    },
                    child: const Text("Güncelle"),
                  ),
                ],
              ),
            ),
            StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("Games")
                          .snapshots(),
                      builder: (context, alinanVeri) {
                        if (alinanVeri.data == null) {
                          return const CircularProgressIndicator();
                        }
                        return Container();
                      })

          ],
        ),
      ),
    );
  }

    veriEkle() {
    DocumentReference veriYolu =
        FirebaseFirestore.instance.collection("Games").doc(ad);
    Map<String, dynamic> oyunlar = {
      "isim": ad,
      "yayinci": publisher,
      "kategori": category,
      "rate": rate
    };

    veriYolu.set(oyunlar).whenComplete(() {
      Fluttertoast.showToast(msg: "Oyun eklendi");
    });
  }

  veriSil() async {
    FirebaseFirestore.instance.collection("Games").doc(ad).delete();
    {
      Fluttertoast.showToast(msg: "Oyun Silindi");
    }
  }

  veriGuncelle() {
    DocumentReference veriYolu =
        FirebaseFirestore.instance.collection("Games").doc(ad);
    Map<String, dynamic> oyunlar = {
      "isim": ad,
      "yayinci": publisher,
      "kategori": category,
      "rate": rate
    };

    veriYolu.update(oyunlar).whenComplete(() async {
      Fluttertoast.showToast(msg: "Oyun Güncellendi");
    });
  }
}
