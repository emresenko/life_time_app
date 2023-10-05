import 'package:flutter/material.dart';
import 'package:life_time_app/constants.dart';
import 'package:life_time_app/user_data.dart';
import 'calculation.dart';
class ResultPage extends StatelessWidget {


  late final UserData userData;
  ResultPage(this.userData);



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.lightGreen,title: Text("SONUÇ SAYFASI") ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 8, child: Center(child: Text("ÖMÜR: ${Calculation(userData).calculate().round().toString()} YIL", style: emreStyle,))),
          Expanded(flex: 1,
              child: ElevatedButton(style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
            child: Center(child: Text("GERİ DÖN", style: emreStyle)),
            onPressed: () {
                Navigator.pop(context);
            },
          ))
        ],
      ),
    );
  }
}
