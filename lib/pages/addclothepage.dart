import '../globals/icons.dart';
import 'package:flutter/material.dart';
import 'package:dressingapp/globals/colors.dart';
import '../globals/clothes.dart';
class AddClothe extends StatefulWidget {
  const AddClothe({super.key});

  @override
  State<AddClothe> createState() => _AddClotheState();
}

class _AddClotheState extends State<AddClothe> {
  double _clotheTemperature = 50;
  Color _temperatureBarColor = temperatureColors[((50 / 25)).truncate()];
  Map<String, bool> clotheTypesMap = {
    for (var type in clotheTypes) type: false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed:() {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: tempColor,
          )
        ),
        backgroundColor: Colors.transparent,
      ),
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
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BoldText(data: "Name"),
              const BasicTextField(data: "Enter clothe name"),
              const SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const BoldText(data: "Type"),
                  Wrap(
                    children: clotheTypesMap.entries.map((entry) {
                      return ChoiceChip(
                        label: Text(entry.key),
                        labelStyle: const TextStyle(
                          color: clothePageColor
                        ),
                        color: WidgetStatePropertyAll((clotheTypesMap[entry.key] ?? false) ? tempColor2 : tempColor),
                        checkmarkColor: clothePageColor,
                        selected: entry.value,
                        onSelected: (bool selected) {
                          setState(() {
                            clotheTypesMap[entry.key] = selected;
                          });
                        },
                      );
                    }).toList(), 
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const BoldText(data: "Temperature"),
                      const SizedBox(width: 10,),
                      Icon(
                        temperatureIcons[((_clotheTemperature / 25)).truncate()],
                        color: temperatureColors[((_clotheTemperature / 25)).truncate()],
                        size: 20,
                      )
                    ],
                  ),
                  Slider(
                    min: 0,
                    max: 100,
                    thumbColor: _temperatureBarColor,
                    activeColor: _temperatureBarColor,
                    divisions: 4,
                    value: _clotheTemperature,
                    onChanged:(value) {
                      setState(() {
                        _clotheTemperature = value;
                        _temperatureBarColor = temperatureColors[((value / 25)).truncate()];
                      });
                    },
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class BasicText extends StatelessWidget {
  final String data;

  const BasicText({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        color: tempColor,
        fontSize: 20,
        fontFamily: "Roboto",
      ),
    );
  }
}

class BoldText extends StatelessWidget {
  final String data;

  const BoldText({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        color: tempColor,
        fontSize: 22,
        fontFamily: "Roboto",
        fontWeight: FontWeight.bold
      ),
    );
  }
}


class BasicTextField extends StatelessWidget {
  final String data;
  
  const BasicTextField({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      cursorColor: tempColor,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelAlignment: FloatingLabelAlignment.center,
        alignLabelWithHint: true,
        labelText: data,
        labelStyle: const TextStyle(
          color: tempColor2,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: tempColor2)
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: tempColor2)
        ),
      ),
    );
  }
}
