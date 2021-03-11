import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final Function onSubmitted;
  final TextEditingController controller;
  final TextInputType textInputType;

  AdaptativeTextField({
    this.label,
    this.onSubmitted,
    this.controller,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              controller: controller,
              onSubmitted: onSubmitted,
              keyboardType: textInputType,
              placeholder: label,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: controller,
            keyboardType: textInputType,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(
              hintText: label,
            ),
          );
  }
}
