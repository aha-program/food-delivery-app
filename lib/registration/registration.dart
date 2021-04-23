import 'package:flutter/material.dart';
import 'package:food_delivery/const.dart';
import 'package:food_delivery/custom_alert_dialog/custom_alert.dart';
import 'package:food_delivery/home_page/home_page.dart';
import 'package:food_delivery/utils/custom_material_button.dart';
import 'package:food_delivery/validation/sign_in_validation.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  _submitIndo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  // !!!This method for authentication errors, not for validation...
  _showErrorMessage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            title: "Authentication error",
            descriptions: "Invalid email address and password combination!",
            text: "Ok",
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<SignInValidation>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 30,
                    spreadRadius: 6,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/icon.png',
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TabBar(
                      indicatorColor: kRedColor,
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      onTap: (index) {
                        // Tab index when user select it, it start from zero
                      },
                      tabs: [
                        Tab(
                          text: "Login",
                        ),
                        Tab(
                          text: "Sign-up",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(50),
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        errorText: validationService.emailAddress.error,
                      ),
                      onChanged: (value) =>
                          validationService.changeEmailAddress(value),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    TextFormField(
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        errorText: validationService.password.error,
                      ),
                      onChanged: (value) =>
                          validationService.changePassword(value),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    Text(
                      "Forgot passcode?",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kRedColor,
                      ),
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    CustomMaterialButton(
                      onPressed: (!validationService.isValid)
                          ? _showErrorMessage
                          : _submitIndo,
                      title: "Login",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
