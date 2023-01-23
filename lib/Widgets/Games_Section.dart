import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dosya/Games_Screen/Game_Screen.dart';

// ignore: must_be_immutable
class GamesSection extends StatelessWidget {
  List name = [
    "Dying Light 2",
    "GTA5",
    "R6",
    "RDR2",
    "Resident Evil 7",
    "The Witcher 3"
  ];

  GamesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Wrap(
        spacing: 10,
        runSpacing: 20,
        children: [
          for (int i = 0; i < name.length; i++)
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GameScreen(name[i])));
              },
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "images/${name[i]}.jpeg",
                      height: 250,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    name[i],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.cyan,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 150,
                    padding: const  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Column(
                      children: const <Widget>[
                        SizedBox(
                          height: 5,
                        ),
                        Text("PG-18"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Action"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("4.8",
                            style: TextStyle(
                              color: Colors.yellow,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}

class Texts {
  static TextStyle texts = const TextStyle(
    color: Colors.cyan,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
