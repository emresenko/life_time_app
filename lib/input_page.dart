import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_time_app/constants.dart';
import 'cinsiyet_widget.dart';
import 'my_container.dart';
import 'constants.dart';
import 'result_page.dart';
import 'user_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {return _MyHomePageState();}
}

class _MyHomePageState extends State<MyHomePage> {

  String? seciliCinsiyet;
  double ciaraSayisi = 0;
  double sporSayisi = 0;
  double kilo = 70;
  double boy = 170;



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'LIFE TIME',
          style: TextStyle(color: Colors.lightGreen),
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(children: <Widget>[
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlinedButton("BOY"),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlinedButton("KİLO")
                  ),
                ),
              ]),
            ),
            Expanded(
                child: MyContainer(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sipor?",
                  style: emreStyle,
                ),
                Text(sporSayisi.round().toString(), style: emreStyle),
                Slider(
                  divisions: 7,
                  inactiveColor: Colors.lightGreen[100],
                  activeColor: Colors.lightGreen,
                  thumbColor: Colors.lightGreen,
                  min: 0,
                  max: 7,
                  value: sporSayisi,
                  onChanged: (double newValue) {
                    setState(() {
                      sporSayisi = newValue;
                    });
                  },
                )
              ],
            ))),
            Expanded(
                child: MyContainer(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ciara?",
                  style: emreStyle,
                ),
                Text(ciaraSayisi.round().toString(), style: emreStyle),
                Slider(
                  inactiveColor: Colors.lightGreen[100],
                  activeColor: Colors.lightGreen,
                  thumbColor: Colors.lightGreen,
                  min: 0,
                  max: 30,
                  value: ciaraSayisi,
                  onChanged: (double newValue) {
                    setState(() {
                      ciaraSayisi = newValue;
                    });
                  },
                )
              ],
            ))),
            Expanded(
              child: Row(children: <Widget>[
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "KADIN";
                      });
                    },
                    renk: seciliCinsiyet == "KADIN"
                        ? Colors.lightGreen[100]
                        : Colors.white,
                    child: IconCinsiyet(
                        cinsiyet: "KADIN", icon: FontAwesomeIcons.venus),
                  ),
                ),
                Expanded(
                    child: MyContainer(
                  onPress: () {
                    setState(() {
                      seciliCinsiyet = "ERKEK";
                    });
                  },
                  renk: seciliCinsiyet == "ERKEK"
                      ? Colors.lightGreen[100]
                      : Colors.white,
                  child: IconCinsiyet(
                      cinsiyet: "ERKEK", icon: FontAwesomeIcons.mars),
                )),
              ]),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
              child: Text("HESAPLA", style: emreStyle ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(

                  UserData(kilo: kilo, boy: boy, seciliCinsiyet: seciliCinsiyet, ciaraSayisi: ciaraSayisi,  sporSayisi: sporSayisi),

                )));
              },
            ),
          ]),

    );
  }

  Row buildRowOutlinedButton(String metin) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            metin,
                            style: emreStyle,
                          )),
                      SizedBox(width: 10),
                      RotatedBox(
                          quarterTurns: 3,
                          child: Text(style: emreStyle, metin == "BOY" ? boy.toString(): kilo.toString())),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  metin == "BOY" ? boy++ : kilo ++;
                                });
                              }, child: Icon(FontAwesomeIcons.arrowUp, color: Colors.lightGreen,)),
                          OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  metin == "BOY" ? boy-- : kilo --;
                                });
                              }, child: Icon(FontAwesomeIcons.arrowDown, color: Colors.lightGreen,)),
                        ],
                      ),
                    ],
                  );
  }
}
