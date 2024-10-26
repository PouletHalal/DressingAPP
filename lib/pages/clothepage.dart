import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dressingapp/globals/colors.dart';
import 'addclothepage.dart';

class Clothepage extends StatefulWidget {
  const Clothepage({super.key});

  @override
  State<Clothepage> createState() => _ClothepageState();
}

class _ClothepageState extends State<Clothepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddClothe()),
          );
        },
        backgroundColor: tempColor2,
        splashColor: tempColor,
        child: const Icon(
          Icons.add,
          color: clothePageColor,
        ),
      ),
      backgroundColor: clothePageColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 20,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Category $index',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: tempColor),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(10),
                  itemCount: Random().nextInt(8),
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                  itemBuilder: (context, index) {
                    return const ClotheCard();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ClotheCard extends StatelessWidget {
  const ClotheCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 1 + Random().nextInt(255),
          1 + Random().nextInt(255), 1 + Random().nextInt(255)),
      width: 99,
    );
  }
}
