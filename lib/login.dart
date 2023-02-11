import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Login extends StatefulWidget {
  final Color colorBackground = const Color(0xFF23242a);
  final Color colorCard = const Color(0xFF1c1c1c);
  final Color primaryColor = const Color(0xFF45F3FF);
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  Animation? animation;
  AnimationController? animationController;
  IntTween? intTween;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.linear,
    );
    animationController!.repeat();

    intTween = IntTween(begin: 0, end: 360);
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.colorBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CustomPaint(
              painter: Login2Painter(
                animation: intTween!.animate(animationController!),
                colorSnake: widget.primaryColor,
              ),
              child: cardLogin(),
            ),
          ),
        ],
      ),
    );
  }

  cardLogin() {
    return Container(
      // alignment: Alignment.center,
      height: min(1080, height() / 2),
      width: min(1080, width() * 0.9),
      decoration: BoxDecoration(
        color: widget.colorCard,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sing in',
              style: textThemeCurrent()
                  .titleLarge!
                  .copyWith(color: widget.primaryColor),
            ),
            SizedBox(height: 20),
            myTextField(hintText: 'Username'),
            myTextField(hintText: 'Password', isPassword: true),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                myTextButton('Forget Password'),
                myTextButton('Sing Up'),
              ],
            ),
            SizedBox(height: 20),
            LayoutBuilder(builder: (context, constraints) {
              print(constraints);
              return SizedBox(
                width: constraints.maxWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(widget.primaryColor),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Login',
                        style: TextStyle(color: widget.colorCard),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  myTextField({required String hintText, bool isPassword = false}) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      cursorColor: widget.primaryColor,
      keyboardType: isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      obscureText: isPassword,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.primaryColor,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: widget.primaryColor,
        )),
        // border: UnderlineInputBorder(
        //   borderSide: BorderSide(color: widget.primaryColor),
        // ),

        filled: false,
        fillColor: Colors.red,
        hintStyle: TextStyle(color: Color(0xFF8f8f8f)),
        hintText: hintText,
      ),
    );
  }

  myTextButton(String text) => TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(color: widget.primaryColor),
      ));

  TextTheme textThemeCurrent() => Theme.of(context).textTheme;
  double height() => MediaQuery.of(context).size.height;
  double width() => MediaQuery.of(context).size.width;
}

class Login2Painter extends CustomPainter {
  final Animation animation;
  final Color colorSnake;

  Login2Painter({required this.animation, required this.colorSnake})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;

    canvas.drawRect(rect, myPaint(rect: rect));
    canvas.drawRect(rect, myPaint(rect: rect, angle: 180.0));
  }

  myPaint({required Rect rect, double angle = 0}) => Paint()
    ..shader = SweepGradient(
      colors: [Colors.transparent, colorSnake],
      startAngle: 0.0,
      stops: [0.8, 1],
      endAngle: 315 * pi / 180,
      transform: GradientRotation((animation.value + angle) * pi / 180),
    ).createShader(rect)
    ..strokeWidth = 1.5
    ..style = PaintingStyle.stroke;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    try {
      return (oldDelegate as Login2Painter).animation.value != animation.value;
    } catch (e) {
      return true;
    }
  }
}
