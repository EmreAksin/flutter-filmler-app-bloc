import 'package:filmler_app/data/entity/filmler.dart';
import 'package:filmler_app/ui/cubit/anasayfa_cubit.dart';
import 'package:filmler_app/ui/views/detay_sayfa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();

}

class _AnasayfaState extends State<Anasayfa> {
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().filmleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Anasayfa"),),
      body: BlocBuilder<AnasayfaCubit,List<Filmler>>(
        builder: (context, filmlerListesi){
          if(filmlerListesi.isNotEmpty){
            return GridView.builder(
              itemCount: filmlerListesi.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1 / 1.8
              ),
              itemBuilder: (context, i){
                  var film = filmlerListesi[i];
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("resimler/${film.resim}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${film.fiyat} ₺", style: TextStyle(fontSize: 25),),
                            ElevatedButton(
                                onPressed: (){
                                  Navigator.push(context, 
                                      MaterialPageRoute(builder: (context)=>DetaySayfa(film: film)));
                                },
                                child: Text("Sepete at"))
                          ],
                        )
                      ],
                    ),
                  );
              },
            );
          }else{
            return Text("Veri gelmedi");
          }
        },
      ),
    );
  }
}
