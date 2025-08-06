import 'package:flutter/material.dart';
import 'package:stay_updated/ui/common/styles.dart';

class SuTextField extends StatelessWidget {
  const SuTextField({super.key, this.hintText, this.keyboardType, this.onChanged, required this.readOnly, this.controller});

  final String? hintText;
  final bool readOnly;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: TextField(
        controller: controller,
        readOnly: readOnly ,
        style:  kTBodyText1.copyWith(color: Colors.black),
        onChanged: onChanged,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: kTBodyText1.copyWith(color: kCNormalGreyColor),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
