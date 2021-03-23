import 'package:flutter/material.dart';
import 'package:flutter_tompay/registration/LoginDetails.dart';
import 'package:get/get.dart';
import 'registration/Personal_details.dart';
import 'registration/Home_address.dart';
import 'registration/result.dart';

void main() {
  runApp(GetMaterialApp(
    home: PersonalDetails(),
    getPages: [
      GetPage(name: '/personal', page: () => PersonalDetails()),
      GetPage(name: '/address', page: () => AddressDetails()),
      GetPage(name: '/login', page: () => LoginDetails()),
      GetPage(name: '/result', page: () => Result()),
    ],
  ));
}

// class GetNavigationApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//         initialRoute: '/',
//       getPages: [
//         GetPage(name: '/', page: () => PersonalDetails()),
//         GetPage(name: '/address', page: () => AddressDetails()),
//       ]);
//   }
// }

