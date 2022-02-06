import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {

  bool sonuc;

  SonucEkrani({required this.sonuc});

  @override
  _SonucEkraniState createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            widget.sonuc ? Image.asset("resimler/smile.png") : Image.asset("resimler/sadsmile.png") ,
            widget.sonuc ? Text("Kazandınız ",style: TextStyle(color: Colors.lightGreen,fontSize: 36),) : Text("Kaybettiniz ",style: TextStyle(color: Colors.red,fontSize: 36),),

            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Tekrar Dene",style:TextStyle(color: Colors.blueGrey,),),
                style: ElevatedButton.styleFrom(primary: Colors.amber,),
                onPressed: (){
                  print("Tekrar Denendi");

                  Navigator.pop(context);
                },
              ),
            ),

          ],
        ),
      ),

    );
  }
}
