import 'package:flutter/material.dart';
import 'package:flutter_tompay/common/bread_crumbs/bread_crumbs.dart';
import 'package:flutter_tompay/common/bread_crumbs/bread_crumbs_item.dart';
import 'package:flutter_tompay/common/buttons/back_button.dart';
import 'package:flutter_tompay/common/inputs/input_password.dart';
import 'package:flutter_tompay/form/custom_text_input.dart';
import 'package:flutter_tompay/form/form.dart';
import 'package:get/get.dart';

class LoginDetails extends StatefulWidget {
  LoginDetails({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginDetails> {
  TextEditingController email = TextEditingController(text: login.value.email);
  TextEditingController password = TextEditingController(text: login.value.password);
  TextEditingController repeatPassword = TextEditingController(text: login.value.repeatPassword);

  LoginDetailsModel personalDetailsModel = new LoginDetailsModel();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Login details',
            style: TextStyle(color: Color(0xFF37494F)),
          ),
          leading: Padding(
              padding: EdgeInsets.all(10),
              child: BackButtonCustom()),
          backgroundColor: Color(0xFFE5EDF3),
          shadowColor: Colors.transparent,
        ),
        backgroundColor: Color(0xffE5EDF3),
        body: Column(
          children: [
            BreadCrumbs(
              children: [
                BreadCrumbsItem(active: true,),
                BreadCrumbsItem(active: true,),
                BreadCrumbsItem(active: true,),
                BreadCrumbsItem()
              ],
            ),
            Center(
              child: MyStatefulWidget(
                children: [
                  CustomTextInput(
                    label: 'Email',
                    controller: email,
                    placeholder: 'Enter email',
                    onSaved: (text) {
                      login.update((val) {
                        val.email = text;
                      });
                    },
                    validator: (String value){
                      if(!value.isEmail && value.isNotEmpty){
                        return ['По-моему это не емейл ))'];
                      }
                      if(value == null || value.isEmpty){
                        return ['Введите Email, пожалуйста'];
                      }
                      return null;

                    },
                  ),
                 InputPassword(
                    label: 'Password',
                    placeholder: 'Enter password',
                    controller: password,
                    onSaved: (text) {
                      login.update((val) {
                        val.password = text;
                      });
                    },
                    validator: (String password) {
                      Pattern pattern = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$';
                      RegExp regex = new RegExp(pattern);
                      if (!regex.hasMatch(password)) {
                        return ['1 Загланая бука, 1 цифра, минимум 8 символов, латиница'];
                      }
                      return null;
                    },
                  ),
                  InputPassword(
                    label: 'Password confirmation',
                    placeholder: 'Repeat password',
                    controller: repeatPassword,
                    onSaved: (text) {
                      login.update((val) {
                        val.repeatPassword = text;
                      });
                    },
                    validator: (String value) {
                      if (value != password.text) {
                        return ['Пароли должны совпасть'];
                      }
                      return null;
                    },
                  ),
                ],
                onPress: () {
                  Get.toNamed("/result");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginDetailsModel {
  String email;
  String password;
  String repeatPassword;

  LoginDetailsModel(
      {this.email = '', this.password = '', this.repeatPassword = ''});
}

final login = LoginDetailsModel().obs;
