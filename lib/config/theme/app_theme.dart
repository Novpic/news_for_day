import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.grey[50],
      appBarTheme: AppBarTheme(
          color: Colors.grey[50],
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          toolbarTextStyle:
              const TextStyle(color: Colors.black, fontFamily: 'Muli'),
          centerTitle: true),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Muli',
        ),
        bodyMedium: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal,
          fontFamily: 'Muli',
        ),
        labelMedium: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          fontFamily: 'Muli',
        ),
      ));
}
