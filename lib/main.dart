import 'package:flutter/material.dart';
import 'package:flutter_application_12/pages/home.dart';
import 'package:flutter_application_12/providers/provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          UiProvider()..init(), // Call init here to load preferences
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier =
        context.watch<UiProvider>(); // Access the notifier from context
    return MaterialApp(
      themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: notifier.darktheme,
      theme: notifier.lighttheme,
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
