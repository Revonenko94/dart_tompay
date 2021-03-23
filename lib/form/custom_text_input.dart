import 'package:flutter/material.dart';
import 'package:flutter_tompay/common/inputs/constructor/container.dart';
import 'package:flutter_tompay/common/inputs/constructor/input_constructor_text.dart';

class CustomTextInput extends StatefulWidget {
  CustomTextInput({
    Key key,
    this.label,
    this.onChange,
    @required this.controller,
    this.onSaved,
    this.placeholder,
    this.onTap,
    this.disabled = false,
    this.keyboard,
    this.validator,
    this.isPassword = false,
  }) : super(key: key);

  final String label;
  final Function onChange;
  final TextEditingController controller;
  final String placeholder;
  final Function onSaved;
  final Function onTap;
  final bool disabled;
  final TextInputType keyboard;
  final bool isPassword;
  final Function validator;

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return InputContainer(label: widget.label, errors: this.errors, children: [
      Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InputConstructorText(
            controller: widget.controller,
            onChange: widget.onChange,
            placeholder: widget.placeholder,
            keyboard: widget.keyboard,
            onTap: widget.onTap,
            disabled: widget.disabled,
            validator: (String value) {
              if (widget.validator != null && widget.validator(value) != null) {
                setState(() {
                  errors = widget.validator(value);
                });
                return '';
              } else {
                setState(() {
                  errors = [];
                });
                return null;
              }
            },
            onSaved: widget.onSaved,
          ),
        ),
      ),
    ]);
  }
}
