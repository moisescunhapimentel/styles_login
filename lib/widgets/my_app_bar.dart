import 'package:flutter/material.dart';

AppBar appBar(BuildContext context,
    {Color? colorArrowBack = Colors.black,
    Color? colorBackground = Colors.transparent}) {
  return AppBar(
    backgroundColor: colorBackground,
    leading: GestureDetector(
      child: Icon(
        Icons.arrow_back_ios_new,
        color: colorArrowBack,
      ),
      onTap: () => Navigator.pop(context),
    ),
  );
}
