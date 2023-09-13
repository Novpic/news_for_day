import 'package:flutter/material.dart';
import 'package:news_for_day/features/daily_news/presentation/pages/home/daily_news_screen.dart';

import 'injection_container.dart';

void main() async {
  await initalDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: DailyNewsScreen());
  }
}
