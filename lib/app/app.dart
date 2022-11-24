
import 'package:fashion_mobile_app/presentation/resources/routes_manager.dart';
import 'package:fashion_mobile_app/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {

  MyApp._internal();


  static final MyApp instance = MyApp._internal();
  /// return singleton
  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.mainRoute,
    );
  }
}
