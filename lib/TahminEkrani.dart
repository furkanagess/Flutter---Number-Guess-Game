import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uygulamasi/SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({Key? key}) : super(key: key);

  @override
  _TahminEkraniState createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak= 5;
  String yonlendirme = "";

  @override
  void initState() {
    super.initState();

    rastgeleSayi = Random().nextInt(100);
    print("Rastgele Sayi : ${rastgeleSayi}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
             Text("Kalan Hak : $kalanHak",style:  TextStyle(color: Colors.black54,fontSize: 30),),
             Text("Yardım : $yonlendirme",style: TextStyle(color: Colors.black54,fontSize: 20),),

            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),


            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Tahmin Et",style:TextStyle(color: Colors.blueGrey,),),
                style: ElevatedButton.styleFrom(primary: Colors.amber,),
                onPressed: (){
                  print("Tahmin Edildi");

                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  SonucEkrani()));
                  setState(() {
                    kalanHak = kalanHak -1;
                  });

                  int tahmin = int.parse(tfTahmin.text);

                  if(tahmin == rastgeleSayi){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  SonucEkrani(sonuc: true,)));
                    return;
                  }

                  if(tahmin> rastgeleSayi){
                    setState(() {
                      yonlendirme = "Tahmini Azalt";
                    });
                  }

                  if(tahmin<rastgeleSayi){
                    setState(() {
                      yonlendirme = "Tahmini Arttır";
                    });
                  }

                  if(kalanHak <= 0){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  SonucEkrani(sonuc: false,)));
                  }

                  tfTahmin.text = "";



                },
              ),
            ),

          ],
        ),
      ),

    );
  }
}
