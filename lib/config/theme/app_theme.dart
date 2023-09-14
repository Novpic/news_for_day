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
  );
}
