import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library/favorite.dart';
import 'package:flutter_library/home.dart';
import 'package:flutter_library/profile.dart';
import 'package:flutter_library/search.dart';

class Navigation extends StatefulWidget {
  Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  // list of icons that required
  // by animated navigation bar
  List<IconData> iconList = [
    Icons.home,
    Icons.search,
    Icons.favorite,
    Icons.person,
  ];
  List<Widget> BodyText = [Home(), Search(), Favorite(), Profile()];
  // default index of the tabs
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    // material app with
    // debugshowcheckedmodebanner false
    return Scaffold(
      body: Center(child: BodyText[_bottomNavIndex]),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0),
        ),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        // navigation bar
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchMargin: 8, // Default notch margin is 8
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        backgroundColor: Colors.brown,
        activeColor: Colors.white, // Set active icon color to white
        inactiveColor: Colors.white, // Set inactive icon color to white
      ),
    );
  }
}
