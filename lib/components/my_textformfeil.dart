import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.radius,
    this.keyType,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final double? radius;
  final TextInputType? keyType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyType,
      inputFormatters: inputFormatters,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText ?? "Enter text",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(radius ?? 15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(radius ?? 15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(radius ?? 15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(radius ?? 15),
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
    );
  }
}
