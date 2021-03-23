import 'package:flutter/material.dart';
import 'concave_decoration.dart';

class NeoContainer extends StatelessWidget {
  NeoContainer(
      {Key key,
      this.inner = false,
      @required this.width,
      @required this.height,
      this.borderRadius = const BorderRadius.all(Radius.circular(8)),
      this.child,
      this.maxHeight = double.infinity,
      this.bothShadow = false})
      : super(key: key);

  final bool inner;
  final bool bothShadow;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final Widget child;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    final innerShadow = ConcaveDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      colors: [
        Color(0xFFCCD9E5),
        Color(0xFFFFFFFF)
      ],
      depth: 10,
    );

    final outerShadow = BoxDecoration(
      border: Border.all(color: Color(0xFFE5EDF3)),
      borderRadius: borderRadius,
      color: Color(0xFFE5EDF3),
      boxShadow: [
        BoxShadow(
          color: Color(0xFF15E508)
        ),
        BoxShadow(
            color: Color(0xFF1391EA)
        )
      ],
    );
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Container(
            decoration: !inner || bothShadow ? outerShadow : null,
          ),
          Container(
            constraints: (BoxConstraints(maxHeight: this.maxHeight)),
            width: width,
            height: height,
            decoration: inner || bothShadow ? innerShadow : null,
            child: child,
          ),
        ],
      ),
    );
  }
}
