import 'package:andreaproject/feed_page.dart';
import 'package:andreaproject/profile_page.dart';
import 'package:andreaproject/search_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> pages = [FeedPage(), SearchPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search",
            activeIcon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
            activeIcon: Icon(Icons.person),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
