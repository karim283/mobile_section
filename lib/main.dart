import 'package:flutter/material.dart';
import 'package:section/add_item/item_model.dart';
import 'package:section/dashboard/navbar.dart';
import 'package:section/favorite/favorite_model.dart';
import 'package:section/profile/user_model.dart';

import 'details/details_screen/details_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserModel()),
      ChangeNotifierProvider(create: (context) => ItemModel()),
      ChangeNotifierProvider(create: (context) => FavoriteModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Navbar(),
    );
  }
}
