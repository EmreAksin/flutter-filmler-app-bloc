import 'package:filmler_app/data/entity/filmler.dart';
import 'package:filmler_app/sqlite/veritabani_yardimcisi.dart';

class FilmlerDaoRepository{
  Future<List<Filmler>> filmleriYukle() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM filmler");

    return List.generate(maps.length,
            (index) {
              var satir = maps[index];
                return Filmler(id: satir["id"], ad: satir["ad"], resim: satir["resim"], fiyat: satir["fiyat"],);

            });
  }
}