// ignore_for_file: must_be_immutable

import 'package:e_shope/screens/PanierScreen.dart';
import 'package:e_shope/screens/chat_screen.dart';
import 'package:e_shope/screens/home_screen.dart';
import 'package:e_shope/screens/user_information_screen.dart';

import 'package:e_shope/widgets/my_app_bar.dart';
import 'package:e_shope/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

List<Widget>? screens;

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key, this.isOk, this.index});
  bool? isOk;
  int? index;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const ChatScreen(),
    const PanierListScreen(),
    const UserInformation()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.isOk = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.index != null ? _selectedIndex = widget.index! : _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isOk != null) {
      if (widget.isOk!) {
        _selectedIndex = 2;
      }
    }

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: const MyAppBar(),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(fontSize: 16),
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 92, 112, 93),
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
// ignore_for_file: must_be_immutable