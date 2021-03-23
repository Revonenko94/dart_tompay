import 'package:flutter/material.dart';
import 'package:flutter_tompay/common/gradient_border/gradient_border.dart';

import '../../neo_container.dart';

class InputContainer extends StatelessWidget {
  InputContainer({Key key, this.label = '', @required this.children, this.errors = const []});

  final String label;
  final List<Widget> children;
  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: Text(this.label,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0x9037494F),
                )),
          ),
          Container(
              width: MediaQuery.of(context).size.width - 32,
              child: CustomPaint(
                painter: GradientPainter(
                    radius: 18,
                    strokeWidth: this.errors.length > 0 ? 1 : 0,
                    gradient:
                        LinearGradient( colors: [Color(0xFFFEF1F1), Color(0xFFE38687)])),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 32,
                        height: 62,
                        clipBehavior: Clip.hardEdge,
                        padding: const EdgeInsets.all(1.50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: LinearGradient(colors: [
                            Color(0xFFF5F8FA),
                            Color(0xFFCED7DF),
                          ]),
                        ),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                width: 2,
                                color: Color(0xFFE5EDF3),
                              ),
                              boxShadow: [
                                const BoxShadow(
                                  color: Color(0xFFE5EDF3),
                                ),
                              ]),
                          child: NeoContainer(
                            height: 60,
                            borderRadius: BorderRadius.circular(16),
                            inner: true,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Row(children: this.children),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: this.errors.length > 0 ? const EdgeInsets.only(top: 7, bottom: 7, left: 18) : const EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: this.errors.map((error) => Text(
                              '•' + error,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFE17373)
                            ),
                          )).toList(),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
