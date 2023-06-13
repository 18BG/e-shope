// ignore_for_file: must_be_immutable

import 'package:e_shope/widgets/input.dart';
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
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Container(
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/victoire.jpeg',
                  fit: BoxFit.contain,
                  width: widht * 0.092,
                ),
              ),
            ),
            SizedBox(
              width: widht * 0.064,
            ),
            Container(
              width: widht * 0.64,
              child: Input(
                hintText: 'Recherche',
                prefixIcon: true,
                iconType: Icons.search,
                rayon: 15.0,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.dehaze,
                color: Colors.black,
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(fontSize: 16),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 92, 112, 93),
          selectedFontSize: 16,
          unselectedFontSize: 14,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _selectedIndex == 0 ? Colors.white : Colors.black,
                ),
                label: 'Accueil',
                tooltip: 'Accueil'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                  color: _selectedIndex == 1 ? Colors.white : Colors.black,
                ),
                label: 'Discussion',
                tooltip: 'Chat'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: _selectedIndex == 2 ? Colors.white : Colors.black,
                ),
                label: 'Chariot',
                tooltip: 'collecté'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2_outlined,
                  color: _selectedIndex == 3 ? Colors.white : Colors.black,
                ),
                label: 'Profil',
                tooltip: 'profil'),
          ]),
      body: _pages[_selectedIndex],
    );
  }
}
