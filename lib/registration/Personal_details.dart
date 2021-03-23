import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_tompay/common/bread_crumbs/bread_crumbs.dart';
import 'package:flutter_tompay/common/bread_crumbs/bread_crumbs_item.dart';
import 'package:flutter_tompay/common/buttons/back_button.dart';
import 'package:flutter_tompay/form/custom_text_input.dart';
import 'package:flutter_tompay/form/form.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class PersonalDetails extends StatefulWidget {
  PersonalDetails({Key key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<PersonalDetails> {

  TextEditingController firstName = TextEditingController(text: personal.value.firstName);
  TextEditingController lastName = TextEditingController(text: personal.value.lastName);
  TextEditingController birthday = TextEditingController(text: personal.value.birthday);
  TextEditingController tinNumber = TextEditingController(text: personal.value.tinNumber);

  PersonalDetailsModel personalDetailsModel = new PersonalDetailsModel();

  FocusNode focusNode = new FocusNode();
  var huita = Jiffy()..subtract(years: 18);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Personal details', style: TextStyle(color: Color(0xFF37494F)),),
          backgroundColor: Color(0xFFE5EDF3),
          shadowColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.all(10),
          child: BackButtonCustom()
          ),

    ),
        backgroundColor: Color(0xffE5EDF3),
        body: Column(
          children: [
            BreadCrumbs(
              children: [
                BreadCrumbsItem(active: true,),
                BreadCrumbsItem(),
                BreadCrumbsItem(),
                BreadCrumbsItem()
              ],
            ),
            Center(
              child: MyStatefulWidget(children: [
                CustomTextInput(
                  label: 'First name',
                  controller: firstName,
                  placeholder: 'First name',
                  validator: (String value){
                    if (value.length == 0 || value.length > 81){
                      return ['Введите Имя', 'Максимальная длина имени не должна привышать 80 символов (Если больше, то мне тебя жаль)'];
                    }
                    return null;
                  },
                  onSaved: (text){
                    personal.update((val) {
                      val.firstName = text;
                    });
                  },
                ),
                CustomTextInput(
                    label: 'Last name',
                    placeholder: 'Last name',
                    controller: lastName,
                    validator: (String value){
                      if (value.length == 0 || value.length > 81){
                        return ['Введите Фамилию', 'Максимальная длина имени не должна привышать 80 символов (Если больше, то мне тебя жаль)'];
                      }
                      return null;
                    },
                    onSaved: (text){
                      personal.update((val) {
                        val.lastName = text;
                      });
                    }),
                CustomTextInput(
                    label: 'Date of birth',
                    placeholder: 'Enter date',
                    disabled: true,
                    controller: birthday,
                    onTap: (){
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(1940, 1, 1),
                          maxTime: huita.dateTime, onConfirm: (date) {
                            birthday.text = DateFormat('dd.MM.yyyy').format(date);
                            personal.update((val) {
                              val.birthday = date.toString();
                            });
                          }, currentTime: DateTime.now(), locale: LocaleType.ru);
                    },
                    validator: (String value){
                      if (value.length == 0){
                        return ['Дату рождения тоже необходимо поставить :)'];
                      }
                      return null;
                    },
                    onSaved: (text){
                      personal.update((val) {
                        val.birthday = text;
                      });
                    }),
                CustomTextInput(
                  label: 'TIN',
                  placeholder: 'Enter TIN number',
                  controller: tinNumber,
                  validator: (String value){
                    if (value.length == 0 || value.length > 10) {
                      return ['Введите TIN'];
                    }
                    return null;
                  },

                  onSaved: (text){
                    personal.update((val) {
                      val.tinNumber = text;
                    });
                  },
                  keyboard: TextInputType.number,
                ),
              ],
                onPress: () {
                  Get.toNamed("/address");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalDetailsModel extends GetxController {
   String firstName;
   String lastName;
   String tinNumber;
   String birthday;

   PersonalDetailsModel({this.firstName='', this.lastName='', this.tinNumber='', this.birthday=''});
}

final personal = PersonalDetailsModel().obs;
