import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {

  const GradientButton({Key key, @required this.onPress});

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: 46,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: -Offset(5, 5),
            color: Colors.white,
          ),
          BoxShadow(
            blurRadius: 15,
            offset: Offset(4.5, 4.5),
            color: Color(0xFF7D6CF8),
          )
        ],
        gradient: LinearGradient(
          colors: [
            Color(0xFF7D6CF8),
            Color(0xFF3F21BF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
          onPressed: this.onPress,
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor:
              MaterialStateProperty.all(Colors.transparent),
              shape:
              MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ))),
          child: Center(
            child: Text(
              'Confirm',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          )),
    );
  }
}
