import 'package:flutter/material.dart';
import 'pages/clothepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageView(
      children: [
        const Clothepage(),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.white,
        ),
      ],
      ),
    );
  }
}
