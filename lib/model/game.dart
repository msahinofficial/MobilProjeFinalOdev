
class Game {

  final String name;
  final String category;
  final String publisher;
  final String rate;

  Game(
      {required this.name,
      required this.publisher,
      required this.rate,
      required this.category

      });

  Map<String, dynamic> toMap() =>
      {'name': name, 'category': category, 'image': publisher, 'rate':rate};

  factory Game.fromMap(map) => Game(
      name: map['name'] ?? "",
      category: map['category'] ?? "",
      publisher: map['image'] ?? "",
      rate: map['image'] ?? "");
      
}

