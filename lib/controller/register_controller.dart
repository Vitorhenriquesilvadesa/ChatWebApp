import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterFormController extends GetxController {
  RegisterFormController({
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
  });

  TextEditingController emailController;
  TextEditingController usernameController;
  TextEditingController passwordController;

  bool validateForm() {
    return _isValidEmail(emailController.text) &&
        _isValidUsername(usernameController.text) &&
        _isValidPassword(passwordController.text);
  }

  bool _isValidEmail(String? email) {
    return email != null &&
        email.isNotEmpty &&
        RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  bool _isValidUsername(String? username) {
    return username != null && username.isNotEmpty;
  }

  bool _isValidPassword(String? password) {
    return password != null && password.length >= 8;
  }

  Future<bool> sendResponse() async {
    if (validateForm()) {
      return true;
      // const String rawUri = "https://"; // TODO put api link here
      // final url = Uri.parse(rawUri);
      // final response = await http.post(
      //   url,
      //   body: {
      //     'email': emailController.text,
      //     'username': usernameController.text,
      //     'password': passwordController.text,
      //   },
      // );

      // if (response.statusCode == 200) {
      //   print('Dados enviados com sucesso!');
      //   return true;
      // } else {
      //   print('Erro ao enviar dados para a API: ${response.statusCode}');
      //   return false;
      // }
    }
    return false;
  }
}
