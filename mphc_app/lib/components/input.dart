import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import '../utils/sys_color.dart';

class CustomInput extends StatefulWidget {
  final Color? textInputColor;
  final String hintText;
  final String? labelText;
  final Color? borderColor;
  final TextEditingController? inputTextValue;
  final TextInputType? textType;
  final int? maxLength;
  final int? minLength;
  final String? validateText;
  final List<TextInputFormatter> textFormat;
  final Color? focusBorderColor;
  final Color? errorBorderColor;
  final Icon? prefixIcon;
  final Color? prefixIconColor;
  final String? prefixText;

  const CustomInput({
    this.textInputColor,
    super.key,
    required this.hintText,
    this.labelText,
    required this.inputTextValue,
    required this.textType,
    required this.maxLength,
    this.minLength,
    required this.validateText,
    // required this.maxLine,
    // required this.minLine,
    this.borderColor,
    this.focusBorderColor,
    this.errorBorderColor,
    required this.textFormat,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixText,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextFormField(
        style: TextStyle(
            fontSize: 18, color: Theme.of(context).colorScheme.primary),
        controller: widget.inputTextValue,
        keyboardType: widget.textType,
        maxLength: widget.maxLength,
        validator: (value) {
          if (value!.isEmpty) {
            return "*Required Field";
          } else if (value.length < widget.minLength!) {
            return widget.validateText;
          }
          return null;
        },
        inputFormatters: widget.textFormat,
        decoration: InputDecoration(
          prefixText: widget.prefixText ?? "",
          prefixStyle: TextStyle(
              fontSize: 18, color: Theme.of(context).colorScheme.secondary),
          hintText: widget.hintText,
          labelText: widget.labelText,
          counterText: '',
          fillColor: Theme.of(context).colorScheme.tertiary,
          filled: true,
          prefixIcon: widget.prefixIcon,
          prefixIconColor: Theme.of(context).colorScheme.secondary,
          border: OutlineInputBorder(
              borderSide: BorderSide(
            width: 0.5,
            color: Theme.of(context).colorScheme.tertiary,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            width: 0.5,
            color: Theme.of(context).colorScheme.tertiary,
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            width: 0.5,
            color: Theme.of(context).colorScheme.tertiary,
          )),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
            width: 0.4,
            color: Theme.of(context).colorScheme.tertiary,
          )),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
            width: 0.9,
            color: Theme.of(context).colorScheme.tertiary,
          )),
        ),
      ),
    );
  }
}
