import 'package:flutter/material.dart';
import 'package:flutter_tompay/common/bread_crumbs/bread_crumbs.dart';
import 'package:flutter_tompay/common/bread_crumbs/bread_crumbs_item.dart';
import 'package:flutter_tompay/common/buttons/back_button.dart';
import 'package:flutter_tompay/form/custom_text_input.dart';
import 'package:flutter_tompay/form/form.dart';
import 'package:get/get.dart';

class AddressDetails extends StatefulWidget {
  AddressDetails({Key key}) : super(key: key);

  @override
  _HomeAddressState createState() => _HomeAddressState();
}

class _HomeAddressState extends State<AddressDetails> {
  TextEditingController country = TextEditingController(text: homeInfo.value.country);
  TextEditingController postal = TextEditingController(text: homeInfo.value.postal);
  TextEditingController city = TextEditingController(text: homeInfo.value.city);
  TextEditingController street = TextEditingController(text: homeInfo.value.street);
  TextEditingController home = TextEditingController(text: homeInfo.value.home);

  AddressDetailsModel addressDetails = new AddressDetailsModel();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Home address',
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
                BreadCrumbsItem(),
                BreadCrumbsItem()
              ],
            ),
            Center(
              child: MyStatefulWidget(
                children: [
                  CustomTextInput(
                      label: 'Country',
                      controller: country,
                      placeholder: 'Mexico',
                      validator: (String value){
                        if (value.length == 0){
                          return ['Обязательное поле', 'А символов вводи сколько душе угодно :)'];
                        }
                        return null;
                      },
                      onSaved: (text) {
                        homeInfo.update((val) {
                          val.country = text;
                        });
                      }),
                  CustomTextInput(
                      label: 'Postal code',
                      placeholder: 'Enter postal code',
                      controller: postal,
                      keyboard: TextInputType.number,
                      validator: (String value){
                        if (!value.isNumericOnly && value.length > 0){
                          return ['Серьезно? Ты уверен, что почтовый индекс состоящий только из ЦИФР должен содержать это?', 'Здесь так не принято'];
                        }
                        if (value.length == 0){
                          return ['Обязательное поле', 'А символов вводи сколько душе угодно :)'];
                        }
                        return null;
                      },
                      onSaved: (text) {
                        homeInfo.update((val) {
                          val.postal = text;
                        });
                      }),
                  CustomTextInput(
                      label: 'City',
                      placeholder: 'Enter your city',
                      controller: city,
                      validator: (String value){
                        if (value.length == 0){
                          return ['Обязательное поле', 'А символов вводи сколько душе угодно :)'];
                        }
                        return null;
                      },
                      onSaved: (text) {
                        homeInfo.update((val) {
                          val.city = text;
                        });
                      }),
                  CustomTextInput(
                      label: 'Street',
                      placeholder: 'Enter your street',
                      controller: street,
                      validator: (String value){
                        if (value.length == 0){
                          return ['Обязательное поле', 'А символов вводи сколько душе угодно :)'];
                        }
                        return null;
                      },
                      onSaved: (text) {
                        homeInfo.update((val) {
                          val.street = text;
                        });
                      }),

                  CustomTextInput(
                      label: 'Apartment/House',
                      placeholder: 'Enter your address',
                      keyboard: TextInputType.number,
                      controller: home,
                      validator: (String value){
                        if (value.length == 0 || value.length > 5){
                          return ['Ты неправильно ввел номер дома, что меня очень пугает'];
                        }
                        return null;
                      },
                      onSaved: (text) {
                        homeInfo.update((val) {
                          val.home = text;
                        });
                      }),
                ],
                onPress: () {
                  Get.toNamed('/login');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddressDetailsModel extends GetxController {
  String country;
  String postal;
  String city;
  String street;
  String home;

  AddressDetailsModel(
      {this.country = '',
      this.home = '',
      this.street = '',
      this.city = '',
      this.postal = ''});
}

final homeInfo = AddressDetailsModel().obs;
