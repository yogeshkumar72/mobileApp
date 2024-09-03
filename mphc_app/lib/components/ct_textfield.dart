import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CtTextField extends StatelessWidget {
  final String hintText;
  final bool ? obsecureText;
  final TextEditingController controller;
  final TextInputFormatter ? inputFormat;

  const CtTextField({super.key,
  required this.hintText,
  required this.controller,
  this.obsecureText,
  this.inputFormat,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: obsecureText ?? false,
        controller:controller,
        // inputFormatters: inputFormat,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Theme.of(context).colorScheme.tertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Theme.of(context).colorScheme.primary),
          ),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color:Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}