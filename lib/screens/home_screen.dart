import 'package:chat_app_admin/screens/contests_screen.dart';
import 'package:chat_app_admin/screens/home.dart';
import 'package:chat_app_admin/screens/story_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homescreen extends StatefulWidget {
 
  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int _pageIndex = 0;

  late PageController _pageController;

  List<Widget> tabPages = [
    home(),
    storyscreen(),
    contests(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
          ),
          child: NavigationBar(
            height: Get.height * .1,
            backgroundColor: Colors.white,
            selectedIndex: _pageIndex,
            onDestinationSelected: (index) => setState(() {
              _pageIndex = index;
            }),
            destinations: [
              NavigationDestination(
                  label: "Home",
                  icon: Icon(
                    Icons.home_rounded,
                    color: Colors.blue,
                  )),
              NavigationDestination(
                  label: "Add story",
                  icon: Icon(
                    Icons.home_max,
                    color: Colors.blue,
                  )),
              NavigationDestination(
                  label: "View Contests",
                  icon: Icon(
                    Icons.analytics_outlined,
                    color: Colors.blue,
                  )),
            ],
          )),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height * 1,
          width: Get.width * 1,
          child: tabPages[_pageIndex],
        ),
      ),
    );
  }
}
