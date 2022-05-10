import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String? hintText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String text)? onChange;
  final Icon? icon;
  final bool? filled;
  final Color? fillColor;
  final Color borderColor;
  final TextInputType? textInputType;
  final bool obscureeText;
  final Widget? suffixIcon;
  const CustomTextField({
    Key? key,
    this.title = '',
    this.hintText,
    this.controller,
    this.inputFormatters,
    this.onChange,
    this.icon,
    this.filled,
    this.fillColor,
    this.borderColor = Colors.black,
    this.textInputType,
    this.suffixIcon,
    this.obscureeText = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureeText,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      cursorColor: Colors.blue,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        fillColor: widget.fillColor,
        filled: widget.filled,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(color: widget.borderColor.withOpacity(0.25))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue)),
      ),
      onChanged: widget.onChange != null
          ? (text) => setState(() => widget.onChange!(text))
          : null,
    );
  }
}
