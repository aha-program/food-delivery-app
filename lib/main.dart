import 'package:flutter/material.dart';
import 'package:food_delivery/const.dart';
import 'package:food_delivery/registration/registration.dart';
import 'package:food_delivery/validation/sign_in_validation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
      fontFamily: "SF Pro Text",
      primaryColor: kRedColor,
      scaffoldBackgroundColor: kBackgroundColor,
    );
    return ChangeNotifierProvider(
      create: (context) => SignInValidation(),
      child: MaterialApp(
        title: 'Food Delivery',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: RegistrationPage(),
      ),
    );
  }
}
