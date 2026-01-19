import 'package:flutter/material.dart';

class LoginTextfieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool hasSuffix;
  final VoidCallback? onSuffixPressed;

  const LoginTextfieldWidget({
    super.key, 
    required this.labelText, 
    required this.controller, 
    required this.keyboardType, 
    required this.textInputAction, 
    required this.obscureText, 
    required this.hasSuffix, 
    this.onSuffixPressed
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        suffixIcon: hasSuffix
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: onSuffixPressed,
              )
            : null,
      ),
      onTapOutside: (event) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }
}