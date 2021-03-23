import 'package:flutter/material.dart';

class BreadCrumbsItem extends StatelessWidget {
  BreadCrumbsItem ({Key key, this.active = false});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4 - 24,
      height: 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
           color: Color(0xFF7D6CF8),
           blurRadius: this.active ? 15 : 0,
           spreadRadius: this.active ? 1 : 0
         )
        ],
        gradient: LinearGradient(
          colors: active ? [
            Color(0xFF7D6CF8),
            Color(0xFF3F21BF),
          ] : [
            Color(0xFFBDC6CC),
            Color(0xFFBDC6CC),
          ]
        )
      ),
    );
  }
}
