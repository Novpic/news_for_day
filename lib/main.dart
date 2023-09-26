import 'package:flutter/material.dart';
import 'package:news_for_day/features/daily_news/presentation/pages/home/daily_news_screen.dart';

import 'config/theme/app_theme.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: const DailyNewsScreen());
  }
}
