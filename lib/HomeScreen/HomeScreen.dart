import 'package:carousel_slider/carousel_slider.dart';
import 'package:dosya/game_view.dart';
import 'package:dosya/model/NewModel.dart';
import "package:flutter/material.dart";
import '../Games_Screen/Online_Game_Screen.dart';
import '../Games_Screen/RPG_Game_Screen.dart';
import '../Widgets/Games_Section.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSection);
    super.initState();
  }

  _handleTabSection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Games Streaming"),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: const Center(
                child: Text("Seçenekler"),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.thumb_up),
              title: const Text("Beğeniler"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => FirebaseCrud())));
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text("Hesabım"),
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: ((context) => GamesView())));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              height: 230,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 750),
              viewportFraction: 0.8,
            ),
            items: const [
              MyContainer(image: "images/R6.jpeg"),
              MyContainer(image: "images/GTA5.jpeg"),
              MyContainer(image: "images/Dying Light 2.jpeg"),
              MyContainer(image: "images/Resident Evil 7.jpeg"),
              MyContainer(image: "images/The Witcher 3.jpeg"),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.cyan.withOpacity(0.5),
            isScrollable: true,
            indicator: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            labelPadding: const EdgeInsets.symmetric(horizontal: 35),
            tabs: const [
              Tab(text: "All"),
              Tab(text: "Online"),
              Tab(text: "RPG"),
              Tab(text: "FPS"),
              Tab(text: "Survivor"),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: [
              GamesSection(),
              OnlineGamesSection(),
              RPGGamesSection(),
              Container(),
              Container()
            ][_tabController.index],
          )
        ],
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  final String image;
  final double borderRadius;

  const MyContainer({Key? key, required this.image, this.borderRadius = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    );
  }
}
