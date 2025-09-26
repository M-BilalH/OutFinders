import 'package:flutter/material.dart';
import 'package:outfinders/Screens/home_page.dart';
import 'package:outfinders/Screens/login.dart';
import 'package:outfinders/Screens/splash_screen.dart';
import 'package:outfinders/Screens/verify_page.dart';
import 'package:outfinders/components/theme.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main()async {
   await Supabase.initialize(
    url: 'https://ugvsipkofligwyorrdet.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVndnNpcGtvZmxpZ3d5b3JyZGV0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM3OTUyODMsImV4cCI6MjA2OTM3MTI4M30.yB44L-W4stBO0nGol-OjUqMm-g-ESSCUOAiFRXUm5DY',
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(),
    );
  }
}