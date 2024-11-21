import 'package:flutter/material.dart';
import 'package:smarthome/view/home.dart';
import 'package:smarthome/view/info.dart';
import 'package:smarthome/view/profile.dart';
import '../shared/ColorConfig.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  late PageController pageController;
  int currentPageIndex = 1;
  final contents = [
    InfoPage(),
    HomePage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: contents,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        selectedItemColor: textSwitchColor,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
          pageController.animateToPage(
            currentPageIndex,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: ""),
        ],
      ),
    );
  }
}
