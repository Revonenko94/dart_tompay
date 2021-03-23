import 'package:flutter/material.dart';
import 'package:flutter_tompay/theme/theme.dart';

import '../concave_decoration.dart';

class NeoButton extends StatefulWidget {
  NeoButton({
    Key key,
    @required this.onPress,
    @required this.width,
    @required this.height,
    this.tooltip,
    this.child,
    this.disabled = false,
    this.pressed = false,
    this.withoutOuterShadow = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
  }) : super(key: key);

  final VoidCallback onPress;
  final bool disabled;
  final bool pressed;
  final bool withoutOuterShadow;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final Widget child;
  final String tooltip;

  @override
  _NeoButtonState createState() => _NeoButtonState();
}

class _NeoButtonState extends State<NeoButton> {
  bool _isPressed = false;

  @override
  void didUpdateWidget(NeoButton oldWidget) {
    if (oldWidget.pressed != widget.pressed) {
      setState(() => _isPressed = widget.pressed);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onPointerDown(PointerDownEvent event) {
    setState(() => _isPressed = true);
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() => _isPressed = widget.pressed);
    widget.onPress();
  }

  @override
  Widget build(BuildContext context) {
    final outerShadow = BoxDecoration(
      borderRadius: widget.borderRadius,
      color: theme.buttonColor,
      boxShadow: theme.outerShadow,
    );

    final innerShadow = ConcaveDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: widget.borderRadius,
      ),
      colors: theme.innerShadowColors,
      depth: 10,
    );
    return Container(
        width: 20 + widget.width,
        height: 20 + widget.height,
        child: Listener(
          onPointerDown: _onPointerDown,
          onPointerUp: _onPointerUp,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                decoration: _isPressed ? innerShadow : outerShadow,
              ),
              Container(
                  child: widget.child
              ),
            ],
          ),
        ));
  }
}
