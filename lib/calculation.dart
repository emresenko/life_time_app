import 'package:life_time_app/user_data.dart';

class Calculation {
  late UserData userData;

  Calculation(this.userData);

  double calculate(){

    double? sonuc;

    sonuc = 90 + userData.sporSayisi! - userData.ciaraSayisi!;
    sonuc = sonuc + (userData.boy!/userData.kilo!);

    if (userData.seciliCinsiyet == "KADIN"){
      return sonuc + 3;
    }
    else if (userData.seciliCinsiyet == "ERKEK") {
      return sonuc - 2;
    }
    else{
      return 0;
    }
  }
}