import 'package:flutter/material.dart';
import 'package:tareq_khashaneh/view/pages/search_page.dart';
import 'package:tareq_khashaneh/view/widgets/app_bar.dart';
import 'package:tareq_khashaneh/view/widgets/bottom_nav_bar.dart';
import 'apple/apple_page.dart';
import 'bussines/Business_page.dart';
import 'tesla/tesla_page.dart';
import 'wall/wall_page.dart';

class MainAppPage extends StatefulWidget {
  MainAppPage({super.key});

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    ApplePage(),
    BusinessPage(),
    TeslaPage(),
    WallPage(),
    SearchPage()
  ];
  final List<String> _namePages = [
    "Apple Page",
    "Bussines Page",
    "Tesla Page",
    "Wall Page",
    "Search Page",
  ];
  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BaseAppBar(title: _namePages[_currentIndex], appBar: AppBar()),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[500],
          onPressed: () => _onPageChanged(4),
          child: Icon(Icons.search_rounded ,color: _currentIndex == 4 ? Colors.black : Colors.white24,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavBar(onPageChanged: _onPageChanged,index: _currentIndex,),
        body: _pages[_currentIndex],
      ),
    );
  }
}
