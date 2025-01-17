import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GoBusPage(),
    );
  }
}

class GoBusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
              child: SizedBox(
                width: 450,
                height: 720,
                child: Image.asset(
                  'assets/image/im.png',
                  width: 150,
                  height: 80,
                ),
              )
            ),
    );
  }
}