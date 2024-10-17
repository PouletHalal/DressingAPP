import 'package:flutter/material.dart';
import 'package:dressingapp/globals/colors.dart';

class AddClothe extends StatefulWidget {
  const AddClothe({super.key});

  @override
  State<AddClothe> createState() => _AddClotheState();
}

class _AddClotheState extends State<AddClothe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: tempColor2,
        splashColor: tempColor,
        child: const Icon(
          Icons.close,
          color: clothePageColor,
        ),
      ),
      backgroundColor: clothePageColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            color: Colors.blueAccent,
          )
        ],
      ),
    );
  }
}
