import 'dart:io';

import 'package:flutter/material.dart';
import 'package:section/profile.dart';

class Second extends StatefulWidget {
  final String title;
  final String body;
  final List<File>? image;

  const Second(
      {this.image, required this.title, required this.body, super.key});

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  Color _favoriteIconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Profile();
              }));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                widget.image == null || widget.image!.isEmpty
                    ? Image.asset(
                        "assets/OIP.jpeg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                    : Image.file(
                        widget.image![0],
                        fit: BoxFit.cover,
                        height: 300,
                        width: double.infinity,
                      ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 310,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _favoriteIconColor = _favoriteIconColor == Colors.grey
                              ? Colors.red
                              : Colors.grey;
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        color: _favoriteIconColor,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.share),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.body),
                ),
                widget.image == null || widget.image!.isEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [])
                    : SizedBox(
                        height: 500,
                        child: GridView.builder(
                            itemCount: widget.image!.length,
                            itemBuilder: (context, index) => Image.file(
                                  widget.image![index],
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10)),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
