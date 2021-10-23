import 'package:flutter/material.dart';
import 'package:radio_app/ui/right_section.dart';
import 'package:radio_app/ui/left_section.dart';

void main() {
  runApp(const MyApp());
}

Map<int, Color> color = {
  50: const Color.fromRGBO(255, 41, 109, .1),
  100: const Color.fromRGBO(255, 41, 109, .2),
  200: const Color.fromRGBO(255, 41, 109, .3),
  300: const Color.fromRGBO(255, 41, 109, .4),
  400: const Color.fromRGBO(255, 41, 109, .5),
  500: const Color.fromRGBO(255, 41, 109, .6),
  600: const Color.fromRGBO(255, 41, 109, .7),
  700: const Color.fromRGBO(255, 41, 109, .8),
  800: const Color.fromRGBO(255, 41, 109, .9),
  900: const Color.fromRGBO(255, 41, 109, 1),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'sfprodisplay',
        scaffoldBackgroundColor: const Color(0xff01012A),
        primarySwatch: colorCustom,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: const Color(0xff080833),
                child: const SafeArea(child: RightPane()),
              )),
          const Expanded(
              flex: 5,
              child: SafeArea(
                child: LeftPane(),
              ))
        ],
      ),
    );
  }
}
