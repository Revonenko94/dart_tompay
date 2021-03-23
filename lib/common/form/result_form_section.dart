import 'package:flutter/material.dart';
import 'package:flutter_tompay/common/buttons/neo_button.dart';

class ResultFormSection extends StatelessWidget {

  const ResultFormSection({Key key, this.children, this.title, this.border = true, this.onPress});

  final bool border;

  final List<Widget>  children;
  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        border: this.border ? Border(bottom: BorderSide(color: Theme.of(context).dividerColor)) : null
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                this.title,
                style: TextStyle(
               fontSize: 17,
               color: Color(0xFF37494F)
              )),
            ),
            ...this.children,

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: 103,
                  height: 36,
                  child: NeoButton(
                      onPress: this.onPress,
                      width: 103,
                      height: 36,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12, left: 12, bottom: 12, right: 8 ),
                          child: Image.asset('lib/assets/Edit.png'),
                        ),
                        Text(
                            'Edit info',
                          style: TextStyle(color: Color(0xFF6049DE), fontSize: 15, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )
              ),
            )
          ]
        ),
      )
    );
  }
}
