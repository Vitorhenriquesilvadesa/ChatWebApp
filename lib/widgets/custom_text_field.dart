import 'package:chat_web_app/style/register_page_style.dart';
import 'package:chat_web_app/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.footerGradient,
    required this.footerThickness,
    required this.cursorColor,
    required this.type,
    required this.controller,
  });

  final String hintText;
  final Gradient footerGradient;
  final double footerThickness;
  final Color cursorColor;
  final FieldType type;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isValid = false;
  int _iconOpacity = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: _validateText,
          controller: widget.controller,
          cursorHeight: 25,
          style: textFieldStyle,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            filled: true,
            border: InputBorder.none,
            suffixIcon: Icon(_isValid ? Icons.check : Icons.close,
                color: Colors.white.withAlpha(_iconOpacity)),
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

  void _validateText(String value) {
    switch (widget.type) {
      case FieldType.email:
        {
          setState(() {
            _isValid = _isValidEmail(widget.controller.text);
            _iconOpacity = _isValid ? 200 : 50;
          });
        }
        break;

      case FieldType.normalText:
        {
          setState(() {
            _isValid = widget.controller.text.isNotEmpty;
            _iconOpacity = _isValid ? 200 : 50;
          });
        }
        break;
    }
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );
    return emailRegex.hasMatch(email);
  }
}
