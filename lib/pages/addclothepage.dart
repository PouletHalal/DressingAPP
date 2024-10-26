import 'dart:io';
import 'dart:math';

import '../globals/icons.dart';
import 'package:flutter/material.dart';
import 'package:dressingapp/globals/colors.dart';
import '../globals/clothes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddClothe extends StatefulWidget {
  const AddClothe({super.key});

  @override
  State<AddClothe> createState() => _AddClotheState();
}

class _AddClotheState extends State<AddClothe> {
  // Color _clotheColor = tempColor2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: tempColor,
            )),
        backgroundColor: clothePageColor,
        surfaceTintColor: clothePageColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ClotheTypeSelector()));
        },
        backgroundColor: tempColor2,
        splashColor: tempColor,
        child: const Icon(
          Icons.check,
          color: clothePageColor,
        ),
      ),
      backgroundColor: clothePageColor,
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoldText(data: "Name"),
          BasicTextField(data: "Enter clothe name"),
        ],
      ),
    );
  }
}

class ClotheTypeSelector extends StatefulWidget {
  const ClotheTypeSelector({
    super.key,
  });

  @override
  State<ClotheTypeSelector> createState() => _ClotheTypeSelectorState();
}

class _ClotheTypeSelectorState extends State<ClotheTypeSelector> {
  Map<String, bool> clotheTypesMap = {
    for (var type in clotheTypes) type: false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const BoldText(data: "Type"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: tempColor,
              )),
          backgroundColor: clothePageColor,
          surfaceTintColor: clothePageColor,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TemperatureSelector()));
          },
          backgroundColor: tempColor2,
          splashColor: tempColor,
          child: const Icon(
            Icons.check,
            color: clothePageColor,
          ),
        ),
        backgroundColor: clothePageColor,
        body: Center(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: clotheTypesMap.entries.map((entry) {
              return ChoiceChip(
                avatar: ImageIcon(
                    AssetImage("assets/images/icons/${clotheIcons[entry.key]}"),
                    color: clothePageColor),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                label: Text(
                  entry.key,
                  style: const TextStyle(color: clothePageColor, fontSize: 20),
                ),
                labelStyle: const TextStyle(color: clothePageColor),
                color: WidgetStatePropertyAll(
                    (clotheTypesMap[entry.key] ?? false)
                        ? tempColor2
                        : tempColor),
                checkmarkColor: clothePageColor,
                showCheckmark: false,
                selected: entry.value,
                onSelected: (bool selected) {
                  setState(() {
                    clotheTypesMap[entry.key] = selected;
                  });
                },
              );
            }).toList(),
          ),
        ));
  }
}

class TemperatureSelector extends StatefulWidget {
  const TemperatureSelector({
    super.key,
  });

  @override
  State<TemperatureSelector> createState() => _TemperatureSelectorState();
}

class _TemperatureSelectorState extends State<TemperatureSelector> {
  double _clotheTemperature = 50;
  Color _temperatureBarColor = temperatureColors[((50 / 25)).truncate()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const BoldText(data: "Temperature"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: tempColor,
              )),
          backgroundColor: clothePageColor,
          surfaceTintColor: clothePageColor,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ImagePickerRow()));
          },
          backgroundColor: tempColor2,
          splashColor: tempColor,
          child: const Icon(
            Icons.check,
            color: clothePageColor,
          ),
        ),
        backgroundColor: clothePageColor,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                temperatureIcons[((_clotheTemperature / 25)).truncate()],
                color:
                    temperatureColors[((_clotheTemperature / 25)).truncate()],
                size: 200,
              ),
              Slider(
                min: 0,
                max: 100,
                thumbColor: _temperatureBarColor,
                activeColor: _temperatureBarColor,
                divisions: 4,
                value: _clotheTemperature,
                onChanged: (value) {
                  setState(() {
                    _clotheTemperature = value;
                    _temperatureBarColor = temperatureColors[
                        ((_clotheTemperature / 25)).truncate()];
                  });
                },
              ),
            ],
          ),
        ));
  }
}

class ClotheColorPicker extends StatelessWidget {
  final Color pickerColor;
  final ValueChanged<Color> onColorChanged;

  const ClotheColorPicker({
    super.key,
    required this.pickerColor,
    required this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: ColorPicker(
            paletteType: PaletteType.hueWheel,
            labelTypes: const [],
            pickerColor: pickerColor,
            onColorChanged: onColorChanged,
          ),
        ),
      ],
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
          fontWeight: FontWeight.bold),
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
      style: const TextStyle(color: tempColor2),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelAlignment: FloatingLabelAlignment.center,
        alignLabelWithHint: true,
        labelText: data,
        labelStyle: const TextStyle(
          color: tempColor,
        ),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: tempColor)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: tempColor)),
      ),
    );
  }
}

class ImagePickerRow extends StatefulWidget {
  const ImagePickerRow({
    super.key,
  });

  @override
  State<ImagePickerRow> createState() => _ImagePickerRowState();
}

class _ImagePickerRowState extends State<ImagePickerRow> {
  File? selectedImage;
  List<File?> imageList = <File>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const BoldText(data: "Pictures"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: tempColor,
              )),
          backgroundColor: clothePageColor,
          surfaceTintColor: clothePageColor,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ColorSelectionPage()));
          },
          backgroundColor: tempColor2,
          splashColor: tempColor,
          child: const Icon(
            Icons.check,
            color: clothePageColor,
          ),
        ),
        backgroundColor: clothePageColor,
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.photo, color: tempColor),
                    onPressed: () {
                      setState(() {
                        _getImageFrom(ImageSource.gallery);
                      });
                    },
                  ),
                  IconButton(
                      icon: const Icon(Icons.camera_alt, color: tempColor),
                      onPressed: () {
                        setState(() {
                          _getImageFrom(ImageSource.camera);
                        });
                      }),
                ],
              ),
              selectedImage != null && !imageList.contains(selectedImage)
                  ? AddPictureToList(
                      selectedImage: selectedImage,
                      onPictureAdded: () {
                        setState(() {
                          imageList.add(selectedImage);
                        });
                      },
                      onPictureDeleted: () {
                        setState(() {
                          imageList.contains(selectedImage)
                              ? imageList.remove(selectedImage)
                              : selectedImage = null;
                        });
                      },
                    )
                  : imageList.isNotEmpty
                      ? DisplayClothePictures(
                          imageList: imageList,
                          onPictureDeleted: (image) {
                            setState(() {
                              if (imageList.contains(image)) {
                                imageList.remove(image);
                              }
                              if (selectedImage == image) {
                                selectedImage = null;
                              }
                            });
                          })
                      : Container()
            ],
          ),
        ));
  }

  Future _getImageFrom(format) async {
    final returnedImage = await ImagePicker().pickImage(source: format);

    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }
}

class AddPictureToList extends StatefulWidget {
  const AddPictureToList({
    super.key,
    required this.selectedImage,
    required this.onPictureAdded,
    required this.onPictureDeleted,
  });

  final File? selectedImage;
  final Function onPictureAdded;
  final Function onPictureDeleted;

  @override
  State<AddPictureToList> createState() => _AddPictureToListState();
}

class _AddPictureToListState extends State<AddPictureToList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox.fromSize(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Image.file(
                    widget.selectedImage!,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(tempColor2)),
                        onPressed: () {
                          widget.onPictureAdded();
                        },
                        icon: const Icon(
                          Icons.check,
                          color: clothePageColor,
                        )),
                    IconButton(
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(tempColor)),
                        onPressed: () {
                          widget.onPictureDeleted();
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: clothePageColor,
                        ))
                  ],
                )
              ],
            ))));
  }
}

class DisplayClothePictures extends StatefulWidget {
  const DisplayClothePictures(
      {super.key, required this.imageList, required this.onPictureDeleted});

  final List<File?> imageList;
  final ValueChanged<File?> onPictureDeleted;

  @override
  State<DisplayClothePictures> createState() => _DisplayClothePicturesState();
}

class _DisplayClothePicturesState extends State<DisplayClothePictures> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter, // Positionner en bas de l'écran
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.imageList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                IconButton(
                    onPressed: () {
                      widget.onPictureDeleted(widget.imageList[index]);
                    },
                    icon: const Icon(Icons.delete)),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15), // Coins arrondis
                    child: Image.file(
                      widget.imageList[index]!,
                      fit: BoxFit.cover,
                      width: 150, // Largeur de chaque carte
                      height: 150,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ColorSelectionPage extends StatefulWidget {
  const ColorSelectionPage({super.key});

  @override
  State<ColorSelectionPage> createState() => _ColorSelectionPageState();
}

class _ColorSelectionPageState extends State<ColorSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BoldText(data: "Temperature"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: tempColor,
            )),
        backgroundColor: clothePageColor,
        surfaceTintColor: clothePageColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ImagePickerRow()));
        },
        backgroundColor: tempColor2,
        splashColor: tempColor,
        child: const Icon(
          Icons.check,
          color: clothePageColor,
        ),
      ),
      backgroundColor: clothePageColor,
    );
  }
}
