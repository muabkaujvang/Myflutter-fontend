import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.tittle,
    this.icon,
    required this.onPressed,
    this.radius,
    this.bgColor,
    this.loading= false,
  });
  final String tittle;
  final Icon? icon;
  final Function() onPressed;
  final Color? bgColor;
  final double? radius;
  final bool? loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 16),
          ),
        ),
        onPressed: onPressed,
        child: loading! ? const Center(child: CircularProgressIndicator()) : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? Container(),
            Text(tittle),
          ],
        ),
      ),
    );
  }
}
