import 'package:flutter/material.dart';

class MyWidget_Container extends StatelessWidget {
  final Widget child;
  final Color renk;

  MyWidget_Container({this.renk = Colors.white, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        color: renk,
      ),
    );
  }
}