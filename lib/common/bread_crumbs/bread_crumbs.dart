import 'package:flutter/material.dart';

class BreadCrumbs extends StatelessWidget {
  BreadCrumbs({Key key, this.children});
  final List<Widget>  children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: this.children,
      ),
    );
  }
}
