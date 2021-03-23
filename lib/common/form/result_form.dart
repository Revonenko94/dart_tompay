import 'package:flutter/material.dart';
import 'package:flutter_tompay/common/buttons/gradient_button.dart';
import 'package:flutter_tompay/common/neo_container.dart';

class ResultForm extends StatelessWidget {
  const ResultForm ({Key key, @required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          constraints: (BoxConstraints( maxHeight: MediaQuery.of(context).size.height - 250,)),
          child: NeoContainer(
              width: MediaQuery.of(context).size.width -32,
              maxHeight: MediaQuery.of(context).size.height - 250,
            inner: true,
            child: SingleChildScrollView(
              child: Column(
                children: this.children,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50, top: 25),
          child: GradientButton(onPress: (){}),
        )
      ],
    );
  }
}
