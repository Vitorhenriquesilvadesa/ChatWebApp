import 'package:chat_web_app/style/register_page_style.dart';
import 'package:flutter/material.dart';

enum FieldType {
  normalText,
  email,
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.hintText,
    required this.footerGradient,
    required this.footerThickness,
    required this.cursorColor,
    required this.controller,
  });

  final String hintText;
  final Gradient footerGradient;
  final double footerThickness;
  final Color cursorColor;
  final TextEditingController controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _showPassword = true;
  bool _isValid = false;

  void _togglePasswordVisible() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: onChanged,
          cursorHeight: 25,
          controller: widget.controller,
          obscureText: !_showPassword,
          style: textFieldStyle,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            filled: true,
            border: InputBorder.none,
            suffixIcon: SizedBox(
              width: 64,
              child: Row(
                children: [
                  Icon(_isValid ? Icons.check : Icons.close),
                  IconButton(
                      onPressed: () {
                        _togglePasswordVisible();
                      },
                      icon: Icon(_showPassword
                          ? Icons.visibility
                          : Icons.visibility_off)),
                ],
              ),
            ),
            label: Text(widget.hintText, style: textFieldHintStyle),
            alignLabelWithHint: true,
            hintStyle: textFieldHintStyle,
          ),
          cursorColor: widget.cursorColor,
        ),
        Container(
          height: widget.footerThickness,
          decoration: BoxDecoration(
            gradient: widget.footerGradient,
          ),
        ),
      ],
    );
  }

  void onChanged(String value) {
    setState(() {
      _isValid = widget.controller.text.length >= 8;
    });
  }
}
