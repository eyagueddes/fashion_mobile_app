import 'package:fashion_mobile_app/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(AppStrings.settingScreen)
    );
  }
}
