// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

List<Widget>? screens;

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _pages = [
    Container(
      padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
      height: 100,
      width: 100,
      child: Center(child: Text("container1")),
    ),
    Container(
      padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
      height: 100,
      width: 100,
      child: Center(child: Text("container2")),
    ),
    Container(
      padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
      height: 100,
      width: 100,
      child: Center(child: Text("container3")),
    ),
    Container(
      margin: EdgeInsets.fromLTRB(25, 25, 24, 10),
      height: 100,
      width: 100,
      color: Colors.green,
    )
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedFontSize: 16,
          unselectedFontSize: 10,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Accueil',
                tooltip: 'Accueil'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                  color: Colors.black,
                ),
                label: 'Discussion',
                tooltip: 'Chat'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
                label: 'Chariot',
                tooltip: 'collecté'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2_outlined,
                  color: Colors.black,
                ),
                label: 'Profil',
                tooltip: 'profil'),
          ]),
      body: _pages[_selectedIndex],
    );
  }
}