
import 'package:fashion_mobile_app/app/di.dart';
import 'package:fashion_mobile_app/domain/models/models.dart';
import 'package:fashion_mobile_app/presentation/bags/bags.dart';
import 'package:fashion_mobile_app/presentation/items_details/item_details.dart';
import 'package:fashion_mobile_app/presentation/main/main.dart';
import 'package:fashion_mobile_app/presentation/main/pages/home/home_screen.dart';
import 'package:fashion_mobile_app/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String mainRoute = '/main';
  static const String homeRoute = '/home';
  // static const String itemDetails = '/itemDetails';
  static const String bags = '/bags';
}

class RouteGenerator {
  static Route<dynamic> getRoute (RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.mainRoute :
        initHomeModule();
        return MaterialPageRoute(builder: (_)=>Main());
      case Routes.homeRoute :
        return MaterialPageRoute(builder: (_)=>HomeScreen());
      // case Routes.itemDetails:
      //   return MaterialPageRoute(builder: (_)=>ItemDetails());
      // case Routes.bags :
      //   return MaterialPageRoute(builder: (_)=>Bags());
      default :
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title:const Text(AppStrings.undefined),
        ),
        body: const Center(child: Text(AppStrings.undefined)),
      );
    });
  }
}