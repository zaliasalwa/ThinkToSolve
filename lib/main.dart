import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'landing_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Crossword Builder',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF3A8C8C),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF3A8C8C),
            brightness: Brightness.dark,
            primary: const Color(0xFF3A8C8C),
            onPrimary: Colors.white,
            secondary: const Color(0xFFF2F2F2),
            onSecondary: Colors.black,
          ),
          useMaterial3: true,
        ),
        home: LandingPage(), // mulai dari landing page
      ),
    ),
  );
}
