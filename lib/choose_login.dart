import 'package:flutter/material.dart';
import 'package:styles_login/game/login.dart';
import 'package:styles_login/google/login.dart';
import 'package:styles_login/slider/login.dart';

class ChooseLogin extends StatefulWidget {
  const ChooseLogin({super.key});

  @override
  State<ChooseLogin> createState() => _ChooseLoginState();
}

class _ChooseLoginState extends State<ChooseLogin> {
  Map<String, dynamic> maps = {
    'Login Google': const LoginGoogle(),
    'Login Slide': const LoginSlider(),
    'Login Game': const LoginGame(),
  };

  List<String>? list;

  @override
  void initState() {
    super.initState();
    list = maps.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Container()),
        const Text(
          'Welcome to my flutter login styles project',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Text(
            'Here is the list of current logins, just click on the name and view',
            style: (TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
        Expanded(
          child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  width: 50,
                  height: 50,
                  child: ListTile(
                    title: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.blue, Colors.blueAccent]),
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        textAlign: TextAlign.center,
                        list![index],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    onTap: () =>
                        Navigator.push(context, MaterialPageRoute(builder: (c) {
                      return maps[list![index]];
                    })),
                  ),
                );
              },
              itemCount: list!.length),
        ),
        Expanded(child: Container()),
      ],
    ));
  }
}
