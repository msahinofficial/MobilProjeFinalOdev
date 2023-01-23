
class Game {
  String? isim;
  String? kategori;
  String? yayinci;
  String? rate;

  Game({this.isim, this.kategori, this.yayinci, this.rate});

  Map<String, dynamic> toMap() => {
    "isim" : isim,
    "kategori" : kategori,
    "yayinci" : yayinci,
    "rate" : rate
  };

  factory Game.fromMap(map) => Game(
    isim : map['isim'],
    kategori : map['kategori'],
    yayinci : map['yayinci'],
    rate : map['rate'],
  );

  
}