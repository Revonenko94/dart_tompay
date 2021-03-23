import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'neo_button.dart';

class BackButtonCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeoButton(
        width: 16,
        height: 16,
        onPress: Get.back,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('lib/assets/ArrowBack.png'),
          ),
        ));
  }
}
