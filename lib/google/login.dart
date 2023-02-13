import 'package:flutter/material.dart';
import 'package:styles_login/widgets/my_app_bar.dart';
import 'package:styles_login/widgets/my_floating_button.dart';

class LoginGoogle extends StatefulWidget {
  const LoginGoogle({super.key});

  @override
  State<LoginGoogle> createState() => _LoginGoogleState();
}

class _LoginGoogleState extends State<LoginGoogle> {
  final double paddingTextButton = 16;
  // final maxSize = const Size(370, 410);
  final maxSize = const Size(450, 500);

  final primaryColor = const Color(0xFF1B66CA);
  final buttonPressed = const Color.fromARGB(255, 20, 72, 139);
  final inputBorder = const Color(0xFF1A73E8);

  final grey = const Color(0xFF5F6368);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 48, left: 40, right: 40, bottom: 36),
              width: maxSize.width,
              height: maxSize.height,
              // color: Colors.red,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sing In',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: const Text('to continue to Gmail'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: myTextField(),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 9),
                    alignment: Alignment.centerLeft,
                    child: myTextButtonForgotEmail(text: 'Forgot Email?'),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: const Text(
                      'Not your computer? Use Guest mode to sign in privately.',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: myTextButtonForgotEmail(text: 'Learn More'),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        myButtonCreateAccount(text: 'Create Account'),
                        myButtonWithBackground(text: 'Next'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: maxSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Português (Brasil)'),
                const SizedBox(width: 8),
                myTextButtonBottom(text: 'Ajuda'),
                myTextButtonBottom(text: 'Privacidade'),
                myTextButtonBottom(text: 'Termos'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: floatingButton(),
    );
  }

  myButtonCreateAccount({Function()? onPressed, required String text}) {
    return TextButton(
      onPressed: onPressed ?? () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed))
            return buttonPressed.withOpacity(.1);
          return Colors.transparent;
        }),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>((states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide.none,
          );
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
          // return Colors.transparent;
        }),
      ),
      child: Text(
        text,
        style: TextStyle(color: primaryColor, fontWeight: FontWeight.w700),
      ),
    );
  }

  myButtonWithBackground({Function()? onPressed, required String text}) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) return buttonPressed;
          return primaryColor;
        }),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>((states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide.none,
          );
        }),
        fixedSize: MaterialStateProperty.resolveWith((states) {
          return const Size(80, 48);
        }),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
  myTextField({String labelText = 'Email or phone'}) {
    return TextField(
      style: const TextStyle(fontWeight: FontWeight.w600),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: inputBorder, width: 2),
          ),
          labelText: labelText,
          floatingLabelStyle: TextStyle(color: inputBorder)),
    );
  }

  myTextButtonForgotEmail({Function()? onPressed, required String text}) {
    return TextButton(
      onPressed: onPressed ?? () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
          return Colors.transparent;
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          return Colors.transparent;
        }),
        padding:
            MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>((states) {
          return const EdgeInsets.only(left: 0);
        }),
      ),
      child: Text(
        text,
        style: TextStyle(color: inputBorder, fontWeight: FontWeight.bold),
      ),
    );
  }

  myTextButtonBottom({Function()? onPressed, required String text}) {
    return TextButton(
      onPressed: onPressed ?? () {},
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
