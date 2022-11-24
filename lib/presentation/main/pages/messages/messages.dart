import 'package:fashion_mobile_app/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(AppStrings.messageScreen)
    );
  }
}
