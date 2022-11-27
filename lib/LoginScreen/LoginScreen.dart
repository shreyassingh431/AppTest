import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textrade/Common/HexColorHelper.dart';
import 'package:textrade/LoginScreen/LoginScreenController.dart';

import '../Common/Constants.dart';

class LoginScreen extends StatelessWidget {
  var loginController = Get.put(LoginScreenControler());
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: appColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                appIcon,
                height: 144,
                width: 144,
              ),
              userIdTextField(),
              const SizedBox(
                height: 5,
              ),
              passwordTextField(),
              const SizedBox(
                height: 50,
              ),
              loginBtn()
            ],
          ),
        ),
      ),
    );
  }

  Widget userIdTextField() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
          controller: loginController.userIdTextFieldController,
          style: const TextStyle(color: Colors.black),
          maxLines: 1,
          decoration: const InputDecoration(
            hintText: 'Please Enter Email ID',
            labelText: "Email id",
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          )),
    );
  }

  Widget passwordTextField() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        obscureText: true,
        controller: loginController.passWordTextFieldController,
        style: const TextStyle(color: Colors.black),
        maxLines: 1,
        decoration: const InputDecoration(
            hintText: 'Please Enter Password',
            labelText: "Password",
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            )),
      ),
    );
  }

  Widget loginBtn() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: HexColor("#EE0000"),
        minimumSize: const Size(150, 40),
      ),
      onPressed: () {
        loginController.loginPressed();
      },
      child: const Text(
        'Login',
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }
}
