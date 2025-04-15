import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ImagePicker imagePicker = ImagePicker();

  File? selectedimage;

  Future<void> imageselector(ImageSource source) async {
    XFile? image = await imagePicker.pickImage(source: source);
    if (image != null && mounted) {
      setState(() {
        selectedimage = File(image!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(children: [
            SizedBox(height: 80),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.grey.shade500,
                    child: selectedimage == null
                        ? Icon(
                            Icons.person,
                            size: 200,
                            color: Colors.grey.shade200,
                          )
                        : ClipOval(
                            child: Image.file(
                                fit: BoxFit.cover,
                                height: 200,
                                width: 200,
                                selectedimage!))),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black,
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                                child: Column(children: [
                                  Text("profile pic"),
                                  Divider(),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        options(
                                          title: "Camera",
                                          icon: Icons.camera_alt,
                                          onpressed: () {
                                            imageselector(ImageSource.camera);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        options(
                                            onpressed: () {
                                              imageselector(
                                                  ImageSource.gallery);

                                              Navigator.pop(context);
                                            },
                                            title: "Gallery",
                                            icon: Icons.image),
                                        if (selectedimage != null)
                                          options(
                                              selectedimage: selectedimage,
                                              onpressed: () {
                                                if (mounted) {
                                                  setState(() {
                                                    selectedimage = null;
                                                  });
                                                }
                                                Navigator.pop(context);
                                              },
                                              title: "Remove",
                                              icon: Icons.delete),
                                      ]),
                                ]),
                              ));
                    },
                    icon: Icon(Icons.camera_alt, size: 35, color: Colors.grey),
                  ),
                )
              ],
            )
          ]),
        ));
  }
}

class options extends StatelessWidget {
  final String title;
  final IconData icon;
  Colors? color;
  File? selectedimage;
  VoidCallback? onpressed;
  options(
      {required this.onpressed,
      this.color,
      this.selectedimage,
      required this.title,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(
        color: selectedimage == null ? Colors.grey : Colors.red,
        onPressed: onpressed,
        icon: Icon(
          icon,
        ),
      ),
      Text(title)
    ]);
  }
}
