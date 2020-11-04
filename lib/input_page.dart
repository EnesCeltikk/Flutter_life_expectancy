import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/result_page.dart';
import 'package:life_expectancy/user_data.dart';

import './icon_cinsiyet.dart';
import './my_container.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool kadinMi_Secili = false;
  double icilenSigara = 0.0;
  double sporGunu = 0.0;
  int kiloDegeri = 70;
  int boyDegeri = 170;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'YAŞAM BEKLENTİSİ',
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: MyWidget_Container(
                      child: buildRow_OutlineButton("BOY"),
                    ),
                  ),
                  Expanded(
                    child: MyWidget_Container(
                      child: buildRow_OutlineButton("KİLO"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyWidget_Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Haftada kaç gün spor yapıyorsunuz?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      sporGunu.round().toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider(
                      min: 0,
                      max: 7,
                      divisions: 7,
                      value: sporGunu,
                      onChanged: (double newValue) {
                        setState(() {
                          sporGunu = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: MyWidget_Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Günde Kaç Sigara İçiyorsunuz?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      icilenSigara.round().toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider(
                      min: 0,
                      max: 30,
                      divisions: 30,
                      value: icilenSigara,
                      onChanged: (double newValue) {
                        setState(() {
                          icilenSigara = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          kadinMi_Secili = true;
                        });
                      },
                      child: MyWidget_Container(
                        renk: kadinMi_Secili == true
                            ? Colors.lightBlue[100]
                            : Colors.white,
                        child: IconCinsiyet_ColumnWidget(
                          icon: FontAwesomeIcons.venus,
                          text: "KADIN",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          kadinMi_Secili = false;
                        });
                      },
                      child: MyWidget_Container(
                        renk: kadinMi_Secili == false
                            ? Colors.lightBlue[100]
                            : Colors.white,
                        child: IconCinsiyet_ColumnWidget(
                          icon: FontAwesomeIcons.mars,
                          text: "ERKEK",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtonTheme(
              height: 50,
              child: FlatButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        UserData(
                            boyDegeri: boyDegeri,
                            kiloDegeri: kiloDegeri,
                            icilenSigara: icilenSigara,
                            kadinMi_Secili: kadinMi_Secili,
                            sporGunu: sporGunu),
                      ),
                    ),
                  );
                },
                child: Text(
                  "HESAPLA",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRow_OutlineButton(String title) {
    return Row(
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            title == "BOY" ? boyDegeri.toString() : kiloDegeri.toString(),
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 25,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlue),
                onPressed: () {
                  setState(() {
                    title == "BOY" ? boyDegeri++ : kiloDegeri++;
                  });
                },
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 10,
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.lightBlue),
                onPressed: () {
                  setState(() {
                    title == "BOY" ? boyDegeri-- : kiloDegeri--;
                  });
                },
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 10,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
