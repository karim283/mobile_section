import 'dart:io';

import 'package:flutter/material.dart';
import 'package:section/main.dart';
import 'package:section/second.dart';
import 'package:image_picker/image_picker.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  TextEditingController title = TextEditingController();

  TextEditingController body = TextEditingController();

  ImagePicker imagePicker = ImagePicker();

  List<File>? selectedimage = [];

  Future<void> imageselector() async {
    List<XFile>? images = await imagePicker.pickMultiImage();
    if (images != null && mounted) {
      setState(() {
        selectedimage!
            .addAll(images.map((toElement) => File(toElement!.path)).toList());

        // selectedimage = File(image!.path);
      });
    }
  }

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/download.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  selectedimage!.isEmpty
                      ? Container(
                          color: Colors.white38,
                          height: 150,
                          width: MediaQuery.sizeOf(context).width - 20,
                          child: IconButton(
                            onPressed: () {
                              imageselector();
                            },
                            icon: Icon(Icons.camera_alt),
                          ),
                        )
                      : Row(
                          children: [
                            Container(
                              color: Colors.white38,
                              height: 100,
                              width: 100,
                              child: IconButton(
                                onPressed: () {
                                  imageselector();
                                },
                                icon: Icon(Icons.camera_alt),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                              width: MediaQuery.sizeOf(context).width - 120,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: selectedimage!
                                    .map((toElement) => Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              child: Image.file(
                                                toElement,
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    selectedimage!.removeAt(
                                                        selectedimage!.indexOf(
                                                            toElement));
                                                  });
                                                },
                                                icon: Icon(Icons.cancel))
                                          ],
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: title,
                    decoration: InputDecoration(
                        hintText: "Title",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: body,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "Body",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Second(
                                      title: title.text,
                                      body: body.text,
                                      image: selectedimage,
                                    )));
                      },
                      child: Icon(Icons.save)),
                ],
              )),
        ),
      ),
    );
  }
}
