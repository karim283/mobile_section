import 'package:flutter/material.dart';
import 'package:section/add_item/item.dart';
import 'package:section/add_item/item_model.dart';
import 'package:section/dashboard/dashboard_screen.dart';

import '../details/details_screen/details_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/download.jpeg'),
          ),
        ),
        child: Consumer<ItemModel>(
          builder: (context, itemModel, child) => ListView(
            padding: const EdgeInsets.all(8),
            children: [
              const SizedBox(height: 200),
              itemModel.selectedImage!.isEmpty
                  ? Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.white38,
                      child: IconButton(
                        onPressed: () {
                          itemModel.imageSelector();
                        },
                        icon: Icon(Icons.camera_alt),
                      ),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width - 300,
                          color: Colors.white38,
                          child: IconButton(
                            onPressed: () {
                              itemModel.imageSelector();
                            },
                            icon: Icon(Icons.camera_alt),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: SizedBox(
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: itemModel.selectedImage!
                                  .map(
                                    (toElement) => Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          child: Image.file(
                                            toElement,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: IconButton(
                                            icon: Icon(Icons.cancel,
                                                color: Colors.red),
                                            onPressed: () {
                                              itemModel.removeImage(
                                                itemModel.selectedImage!
                                                    .indexOf(toElement),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 16),
              TextField(
                controller: title,
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: body,
                minLines: 3,
                maxLines: 7,
                decoration: const InputDecoration(
                  hintText: "Body",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          final item = Provider.of<ItemModel>(context, listen: false);
          item.addItem(Item(
            images: List.from(item.selectedImage!),
            title: title.text,
            body: body.text,
            favorite: false,
          ));
          item.selectedImage!.clear();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
        },
      ),
    );
  }
}
