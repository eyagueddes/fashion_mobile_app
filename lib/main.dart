import 'package:fashion_mobile_app/app/app.dart';
import 'package:fashion_mobile_app/app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initAppModule();
  runApp(ProviderScope(child: MyApp()));
}

