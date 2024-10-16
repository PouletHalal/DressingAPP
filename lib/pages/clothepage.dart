import 'package:flutter/material.dart';
import 'package:dressingapp/globals/colors.dart';

class Clothepage extends StatefulWidget {
  const Clothepage({super.key});

  @override
  State<Clothepage> createState() => _ClothepageState();
}

class _ClothepageState extends State<Clothepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: clothePageColor,
    );
  }
}
