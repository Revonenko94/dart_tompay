import 'package:flutter/material.dart';
import 'package:flutter_tompay/common/buttons/neo_button.dart';
import 'constructor/container.dart';
import 'constructor/input_constructor_text.dart';

class InputPassword extends StatefulWidget {
  InputPassword(
      {Key key,
      this.controller,
      this.validator,
      this.onSaved,
      this.placeholder = '',
      this.label = '',
      this.onChange})
      : super(key: key,);

  final TextEditingController controller;
  final String label;
  final Function onChange;
  final String placeholder;
  final Function onSaved;
  final Function validator;

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  var hidePassword = false;
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
            isPassword: !this.hidePassword,
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
      NeoButton(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(hidePassword ? 'lib/assets/Glaz.png' : 'lib/assets/NetuGlaza.png'),
            ),
          ),
          onPress: () {
            setState(() {
              hidePassword = !this.hidePassword;
            });
          },
          width: 10,
          height: 10),
    ]);
  }
}
