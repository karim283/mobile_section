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
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  FloatingActionButton(
                      onPressed: () {}, child: Icon(Icons.image)),
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

// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class First extends StatefulWidget {
//   const First({super.key});

//   @override
//   State<First> createState() => _FirstState();
// }

// class _FirstState extends State<First> {
//   TextEditingController title = TextEditingController();
//   TextEditingController body = TextEditingController();
//   List<XFile> images = []; // List to store selected images

//   @override
//   void dispose() {
//     title.dispose();
//     body.dispose();
//     super.dispose();
//   }

//   // Function to pick multiple images with permission check
//   Future<void> _pickImages() async {
//     // Request permission for storage access
//     PermissionStatus permissionStatus = await Permission.photos.request();

//     if (permissionStatus.isGranted) {
//       try {
//         final ImagePicker _picker = ImagePicker();

//         // Pick images one by one and add them to the list
//         final List<XFile>? pickedImages = await _picker.pickMultiImage();

//         if (pickedImages != null) {
//           setState(() {
//             images.addAll(pickedImages); // Add the selected images to the list
//           });
//         }
//       } catch (e) {
//         print("Error picking images: $e");
//       }
//     } else {
//       print("Permission Denied");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/download.jpeg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 SizedBox(height: 150),
//                 // Image picker button
//                 FloatingActionButton(
//                   onPressed: _pickImages,
//                   child: Icon(Icons.image),
//                 ),
//                 SizedBox(height: 15),
//                 // Display the selected images
//                 images.isNotEmpty
//                     ? SizedBox(
//                         height: 100,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: images.length,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: const EdgeInsets.all(4.0),
//                               child: Image.file(
//                                 File(images[index].path),
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                     : Text("No images selected"),
//                 SizedBox(height: 15),
//                 TextField(
//                   controller: title,
//                   decoration: InputDecoration(
//                     hintText: "Title",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 TextField(
//                   controller: body,
//                   maxLines: 5,
//                   decoration: InputDecoration(
//                     hintText: "Body",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 FloatingActionButton(
//                   onPressed: () {
//                     // Handle save or navigate logic here
//                   },
//                   child: Icon(Icons.save),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
