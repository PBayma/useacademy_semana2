import 'package:flutter/material.dart';
import 'ui/components/app_theme.dart';
import 'ui/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nerdflix',
      theme: AppTheme.lightThemeData,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
