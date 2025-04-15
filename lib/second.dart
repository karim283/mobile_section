import 'package:flutter/material.dart';
import 'package:section/profile.dart';

class Second extends StatefulWidget {
  final String title;
  final String body;

  const Second({required this.title, required this.body, super.key});

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
                Image.asset(
                  "assets/OIP.jpeg",
                  fit: BoxFit.cover,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
