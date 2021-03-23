import 'package:flutter/material.dart';
import 'package:flutter_tompay/common/bread_crumbs/bread_crumbs.dart';
import 'package:flutter_tompay/common/bread_crumbs/bread_crumbs_item.dart';
import 'package:flutter_tompay/common/buttons/back_button.dart';
import 'package:flutter_tompay/common/form/result_form.dart';
import 'package:flutter_tompay/common/form/result_form_section.dart';
import 'package:flutter_tompay/registration/Home_address.dart';
import 'package:flutter_tompay/registration/LoginDetails.dart';
import 'package:get/get.dart';

import 'Personal_details.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confirmation Info',
          style: TextStyle(color: Color(0xFF37494F)),
        ),
        leading:
            Padding(padding: EdgeInsets.all(10), child: BackButtonCustom()),
        backgroundColor: Color(0xFFE5EDF3),
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Color(0xffE5EDF3),
      body: Column(
        children: [
          BreadCrumbs(
            children: [
              BreadCrumbsItem(
                active: true,
              ),
              BreadCrumbsItem(
                active: true,
              ),
              BreadCrumbsItem(
                active: true,
              ),
              BreadCrumbsItem(
                active: true,
              )
            ],
          ),
          ResultForm(
            children: [
              ResultFormSection(title: 'Personal details',
                  onPress: () {
                Get.toNamed('/personal');
                  },
                  children: [
                Obx(() => Text('First name: ${personal.value.firstName}',
                    style: StyleTextCustom())),
                Obx(() => Text('Last name: ${personal.value.lastName}',
                    style: StyleTextCustom())),
                Obx(() => Text('Date of birth: ${personal.value.birthday}',
                    style: StyleTextCustom())),
                Obx(() => Text('TIN: ${personal.value.tinNumber}',
                    style: StyleTextCustom()))
              ]),
              ResultFormSection(title: 'Home address',
                  onPress: () {
                    Get.toNamed('/address');
                  },
                  children: [
                Obx(() => Text('Country: ${homeInfo.value.country}',
                    style: StyleTextCustom())),
                Obx(() => Text('Postal code: ${homeInfo.value.postal}',
                    style: StyleTextCustom())),
                Obx(() => Text('City: ${homeInfo.value.city}',
                    style: StyleTextCustom())),
                Obx(() => Text('Apartment / House: ${homeInfo.value.home}',
                    style: StyleTextCustom()))
              ]),
              ResultFormSection(
                  title: 'Login details',
                  border: false,
                  onPress: () {
                    Get.toNamed('/login');
                  },
                  children: [
                    Obx(() => Text('Email: ${login.value.email}',
                        style: StyleTextCustom())),
                    Obx(() => Text('Password: ${login.value.password}',
                        style: StyleTextCustom())),
                  ])
            ],
          ),
        ],
      ),
    );
  }
}

class StyleTextCustom extends TextStyle {
  final double fontSize = 17;
  final FontWeight fontWeight = FontWeight.w600;
  final Color color = Color(0xFF6B7A80);
}
