import 'package:flutter/material.dart';
import 'package:styles_login/widgets/my_app_bar.dart';
import 'package:styles_login/widgets/my_floating_button.dart';

class LoginSlider extends StatefulWidget {
  const LoginSlider({super.key});

  @override
  State<LoginSlider> createState() => _LoginSliderState();
}

class _LoginSliderState extends State<LoginSlider>
    with SingleTickerProviderStateMixin {
  final Color colorCard = Colors.white;
  final Color colorCardBackgroud = const Color(0xFFC79CD9);
  final Color colorText = const Color.fromARGB(255, 125, 72, 148);

  final duration = const Duration(milliseconds: 450);
  final Curve curve = Curves.easeOutQuart;

  final borderRadius = const Radius.circular(10);

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassowrd = TextEditingController();
  TextEditingController email = TextEditingController();

  Animation<double>? animation;
  AnimationController? animationController;

  double? top = 0;
  double? bottom;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: duration);
    animation = Tween<double>(
      begin: 0,
      end: 1.0,
    ).animate(animationController!);
    animationController!.forward(from: 1);
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: height() * 0.7,
          width: width() * 0.9,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.all(borderRadius)),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: colorCardBackgroud,
                    borderRadius: BorderRadius.all(borderRadius)),
                alignment: Alignment.bottomCenter,
                height: height() * 0.7,
                width: width() * 0.9,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        child: SizedBox(
                          height: height() * 0.7 * 0.2,
                          width: width() * 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already Have an Account?'),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: myButton(
                                    onPressed: () {
                                      setState(() {
                                        top = 0;
                                        username.text = username.text;
                                        password.text = password.text;
                                        email.text = '';
                                        confirmPassowrd.text = '';
                                      });
                                      animationController!.forward(from: 0.0);
                                    },
                                    text: 'Sing In'),
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                        bottom: 0,
                        child: SizedBox(
                          height: height() * 0.7 * 0.2,
                          width: width() * 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an Account?"),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: myButton(
                                    onPressed: () {
                                      setState(() {
                                        top = height() * .7 * .2;
                                        username.text = username.text;
                                        password.text = password.text;
                                      });
                                      animationController!.forward(from: 0.0);
                                    },
                                    text: 'Sing Up'),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: duration,
                curve: curve,
                top: top,
                bottom: bottom,
                child: FadeTransition(
                  opacity: animation!,
                  child: Container(
                    // duration: duration,
                    height: height() * 0.7 * 0.8,
                    width: width() * 0.9,
                    decoration: BoxDecoration(
                      color: colorCard,
                      borderRadius: top == 0
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))
                          : const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: top == 0
                            ? [
                                Text(
                                  'Sing In',
                                  style: textThemeCurrent()
                                      .titleLarge!
                                      .copyWith(color: colorText),
                                ),
                                const SizedBox(height: 50),
                                myTextField(
                                    text: 'Username',
                                    textEditingController: username),
                                myTextField(
                                  text: 'Password',
                                  textInputType: TextInputType.visiblePassword,
                                  textEditingController: password,
                                  isPassword: true,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text('Forget Password'),
                                  ),
                                ),
                                const SizedBox(height: 50),
                                myButtonMain(buttonText: 'login'),
                              ]
                            : [
                                Text(
                                  'Sing Up',
                                  style: textThemeCurrent()
                                      .titleLarge!
                                      .copyWith(color: colorText),
                                ),
                                const SizedBox(height: 50),
                                myTextField(
                                    text: 'Username',
                                    textEditingController: username),
                                myTextField(
                                    text: 'Email',
                                    textInputType: TextInputType.emailAddress,
                                    textEditingController: email),
                                myTextField(
                                    text: 'Password',
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    isPassword: true,
                                    textEditingController: password),
                                myTextField(
                                    text: 'Confirm Password',
                                    isPassword: true,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    textEditingController: confirmPassowrd),
                                const SizedBox(height: 50),
                                myButtonMain(buttonText: 'create account'),
                              ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: floatingButton(),
    );
  }

  myTextField(
      {required String text,
      required textEditingController,
      TextInputType textInputType = TextInputType.name,
      bool isPassword = false}) {
    return TextField(
      controller: textEditingController,
      obscureText: isPassword,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: text,
      ),
    );
  }

  ElevatedButton myButton(
      {required Function()? onPressed,
      required String text,
      Color colorText = const Color.fromARGB(255, 125, 72, 148)}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: colorText),
      ),
    );
  }

  ElevatedButton myButtonMain({required String buttonText}) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.purple;
          }
          return colorText;
        }),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
          return TextStyle(color: colorCard);
        }),
        fixedSize: MaterialStateProperty.resolveWith<Size>((states) {
          return Size(width(), 40);
        }),
      ),
      child: Text(
        buttonText.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(color: colorCard),
      ),
    );
  }

  TextTheme textThemeCurrent() => Theme.of(context).textTheme;
  double height() => MediaQuery.of(context).size.height;
  double width() => MediaQuery.of(context).size.width;
}
