import 'package:flutter/material.dart';
import 'package:section/dashboard/dashboard_screen.dart';
import 'package:section/favorite/favorite_screen.dart';
import 'package:section/profile/profile_page/profile_page.dart';
import 'package:section/quote/quote_screen.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        DashboardScreen(),
        QuoteScreen(),
        FavoriteScreen(),
        ProfilePage()
      ][_selectedIndex],
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.dashboard), label: "dashboard"),
            NavigationDestination(
                icon: Icon(Icons.format_quote), label: "quote"),
            NavigationDestination(
                icon: Icon(Icons.favorite), label: "favorite"),
            NavigationDestination(icon: Icon(Icons.person), label: "person"),
          ]),
    );
  }
}
