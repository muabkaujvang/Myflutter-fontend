import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CateTextformfeil extends StatelessWidget {
  const CateTextformfeil({super.key, this.keyType, this.hinText, this.radius, required this.controller, this.validator});

  final TextInputType? keyType;
  final String? hinText;
  final double? radius;
   final TextEditingController controller;
     final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyType,
      controller: controller,
       decoration: InputDecoration(
        hintText: hinText ?? "Enter text",
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
