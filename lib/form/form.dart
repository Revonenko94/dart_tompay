import 'package:flutter/material.dart';
import 'package:flutter_tompay/common/buttons/gradient_button.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key, this.children, this.onPress}) : super(key: key);

  final List<Widget> children;
  final Function onPress;

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSubmitted = false;


  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: this.isSubmitted ? AutovalidateMode.onUserInteraction : null,
      key: _formKey,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 220,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: widget.children
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GradientButton(
              onPress: (){
                _formKey.currentState.save();
                setState(() {
                  isSubmitted = true;
                });
                if(_formKey.currentState.validate()){
                  widget.onPress();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}





