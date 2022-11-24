import 'package:fashion_mobile_app/presentation/main/pages/gift/gifts.dart';
import 'package:fashion_mobile_app/presentation/main/pages/home/home_screen.dart';
import 'package:fashion_mobile_app/presentation/main/pages/messages/messages.dart';
import 'package:fashion_mobile_app/presentation/main/pages/settings/settings.dart';
import 'package:fashion_mobile_app/presentation/resources/color_manager.dart';
import 'package:fashion_mobile_app/presentation/resources/icon_broken.dart';
import 'package:fashion_mobile_app/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';

class Main extends StatefulWidget {

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  List<Widget> pages = [HomeScreen(),MessagesScreen(),GiftsScreen(),SettingsScreen()];

  List<String> titles = [
    AppStrings.homeScreen,
    AppStrings.messageScreen,
    AppStrings.giftScreen,
    AppStrings.settingScreen
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorManager.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(IconBroken.Home),label:AppStrings.homeScreen),
          BottomNavigationBarItem(icon: Icon(IconBroken.Message),label:AppStrings.messageScreen),
          BottomNavigationBarItem(icon: Icon(IconBroken.Bag),label:AppStrings.giftScreen),
          BottomNavigationBarItem(icon: Icon(IconBroken.Profile),label:AppStrings.settingScreen),
        ]
      ),
      body: pages[_currentIndex],
    );
  }

  onTap(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}
