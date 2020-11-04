import 'dart:math';

import 'package:life_expectancy/user_data.dart';

class Hesaplama{
  var rng = new Random();

  UserData _userData;
  Hesaplama(this._userData);




double hesap_yap(){
double sonuc;

sonuc=70+_userData.sporGunu*3-_userData.icilenSigara*0.8;
sonuc=sonuc + (_userData.boyDegeri/_userData.kiloDegeri);

if(_userData.kadinMi_Secili){sonuc+=5;}

sonuc+=rng.nextInt(41)-1;

return sonuc;
}}