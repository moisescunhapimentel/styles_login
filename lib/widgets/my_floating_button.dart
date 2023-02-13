import 'package:flutter/material.dart';

floatingButton({
  Function()? onPressed,
  String text = 'Visualizar Classe',
  Color colorButton = Colors.blueAccent,
  Color colorButtonPressed = Colors.blue,
  Color colorText = Colors.white,
}) {
  return ElevatedButton(
    onPressed: onPressed ?? () {},
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return colorButtonPressed;
        }
        return colorButtonPressed;
      }),
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: colorText),
    ),
  );
}
