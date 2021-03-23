import 'package:flutter/material.dart';

class InputConstructorText extends StatelessWidget {
  InputConstructorText(
      {Key key,
        this.onChange,
        this.controller,
        this.onSaved,
        this.placeholder = '',
        this.onTap,
        this.disabled = false,
        this.keyboard,
        this.validator,
        this.isPassword = false});

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
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: TextFormField(
        style: TextStyle(
            color: Color(0xFF37494F),
            fontWeight: FontWeight.w600),
        onTap: this.onTap,
        onChanged: this.onChange,
        onSaved: this.onSaved,
        readOnly: this.disabled,
        obscureText: this.isPassword,
        enableInteractiveSelection: this.disabled,
        decoration: InputDecoration(
          hintText: this.placeholder,
          hintStyle: TextStyle(color: Color(0xFFADB6BC)),
          border: InputBorder.none,
          errorStyle: TextStyle(height: 0),
        ),
        validator: (value){
         return  this.validator(value);
        },
        // validator: (String value) {
        //   if(this.validator != null){
        //     this.validator(value);
        //     return '';
        //   }  else {
        //     if (value == null || value.isEmpty) {
        //       return 'С пустым полем можно только на Ворд Пресс';
        //     }
        //     return null;
        //   }
        // },
        controller: this.controller,
        cursorColor: Color(0xFF37494F),
        keyboardType: this.keyboard,
      ),
    );
  }
}
