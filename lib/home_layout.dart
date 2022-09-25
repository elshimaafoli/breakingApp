import 'package:breaking_app/constants/my_colors.dart';
import 'package:breaking_app/presentation/screens/characters_screen.dart';
import 'package:breaking_app/presentation/screens/episodes_screen.dart';
import 'package:breaking_app/presentation/screens/seasonsScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List _screens = [
    CharactersScreen(),
    SeasonsScreen(),
    Center(
      child: Text('another'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Characters'),
          BottomNavigationBarItem(
              icon: Icon(Icons.watch_sharp), label: 'Episodes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.watch_later_outlined), label: 'In Progress'),
        ],
        type: BottomNavigationBarType.shifting,
        elevation: 15,
        selectedItemColor: MyColors.myBrown,
        unselectedItemColor: MyColors.myCoffee,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
      ),
    );
  }
}
