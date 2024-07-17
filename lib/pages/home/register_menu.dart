import 'package:chat_web_app/constants/app_color.dart';
import 'package:chat_web_app/controller/register_controller.dart';
import 'package:chat_web_app/style/register_page_style.dart';
import 'package:chat_web_app/widgets/custom_text_field.dart';
import 'package:chat_web_app/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

class RegisterMenu extends StatefulWidget {
  const RegisterMenu({super.key});

  @override
  State<RegisterMenu> createState() => _RegisterMenuState();
}

class _RegisterMenuState extends State<RegisterMenu> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late final RegisterFormController _formController;

  @override
  void initState() {
    super.initState();
    _formController = RegisterFormController(
      emailController: _emailController,
      usernameController: _usernameController,
      passwordController: _passwordController,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Sign In", style: signInLabelStyle),
          const SizedBox(height: 50),
          CustomTextField(
            controller: _emailController,
            type: FieldType.email,
            hintText: "Email Address",
            cursorColor: cursorColor1,
            footerGradient: const LinearGradient(
              colors: <Color>[
                registerInputGradient1,
                registerInputGradient2,
                registerInputGradient3,
              ],
            ),
            footerThickness: 2,
          ),
          const SizedBox(height: 50),
          CustomTextField(
            controller: _usernameController,
            type: FieldType.normalText,
            hintText: "Username",
            cursorColor: cursorColor1,
            footerGradient: const LinearGradient(
              colors: <Color>[
                registerInputGradient1,
                registerInputGradient2,
                registerInputGradient3,
              ],
            ),
            footerThickness: 2,
          ),
          const SizedBox(height: 50),
          PasswordTextField(
            controller: _passwordController,
            hintText: "Password",
            cursorColor: cursorColor1,
            footerGradient: const LinearGradient(
              colors: <Color>[
                registerInputGradient1,
                registerInputGradient2,
                registerInputGradient3,
              ],
            ),
            footerThickness: 2,
          ),
          const SizedBox(height: 100),
          Container(
            width: double.maxFinite,
            height: 60,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(colors: <Color>[
                registerButtonGradient3,
                registerButtonGradient2,
                registerButtonGradient1,
              ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            ),
            child: ElevatedButton(
              onPressed: () async {
                if (_formController.validateForm()) {
                  debugPrint("Formulario valido");
                  if (await _formController.sendResponse()) {}
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                padding: const EdgeInsets.all(10),
              ),
              child: const Text("Register",
                  textAlign: TextAlign.center, style: landButtonTextStyle),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text("Or Login if you already registered.",
                  style: orLoginButtonStyle))
        ],
      ),
    );
  }
}
