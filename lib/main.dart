import 'package:flutter/material.dart';
import 'package:planit/utils/global_resources.dart';
import 'package:planit/views/widgets/main_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: GlobalResources.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      routerConfig:
          MainLayout.router, // Usa il router configurato in MainLayout
    );
  }
}
