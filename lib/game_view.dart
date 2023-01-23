
import 'package:flutter/Material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'GameViewModel.dart';
import 'game.dart';

class GamesView extends StatefulWidget {
  @override
  _GamesViewState createState() => _GamesViewState();
}

class _GamesViewState extends State<GamesView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameViewModel>(
      create: (_) => GameViewModel(),
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(title: Text('OYUN LİSTESİ')),
        body: Center(
          child: Column(children: [
            StreamBuilder<List<Game>>(
              stream: Provider.of<GameViewModel>(context,listen: false).getGameList(),
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.hasError) {
                  print(asyncSnapshot.error);
                  return Center(
                      child:
                          Text('Bir Hata Oluştu, daha sonra tekrar deneyiniz'));
                } else {
                  if (!asyncSnapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    List<Game> kitapList = asyncSnapshot.data!;
                    return BuildListView(kitapList: kitapList); //, key: null,
                  }
                }
              },
            ),
            Divider(),
          ]),
        ),
      ),
    );
  }
}

class BuildListView extends StatefulWidget {
  const BuildListView({
    super.key,
    required this.kitapList,
  });

  final List<Game> kitapList;

  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  bool isFiltering = false;
  late List<Game> filteredList;

  @override
  Widget build(BuildContext context) {
    var fullList = widget.kitapList;
    return Flexible(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Arama: Oyun adı',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0))),
              onChanged: (query) {
                if (query.isNotEmpty) {
                  isFiltering = true;

                  setState(() {
                    filteredList = fullList
                        .where((book) => book.isim!.contains(query))
                        .toList();
                  });
                } else {
                  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                  setState(() {
                    isFiltering = false;
                  });
                }
              },
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: isFiltering ? filteredList.length : fullList.length,
                itemBuilder: (context, index) {
                  var list = isFiltering ? filteredList : fullList;
                  return Slidable(
                      // ignore: sort_child_properties_last
                      child: Card(
                        child: ListTile(
                          title: Text(list[index].isim??""),
                          subtitle: Text(list[index].kategori??""),
                          trailing: Text(list[index].rate??""),
                          leading: Text(list[index].yayinci??""),
                        ),
                      ),
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),

                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {}),
                        children: [
                          SlidableAction(
                            onPressed: (BuildContext context) async {
                              await Provider.of<GameViewModel>(context,
                                      listen: false)
                                  .deleteBook(list[index]);
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),);
                }),
          ),
        ],
      ),
    );
  }
}
