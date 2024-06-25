// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/diary_screen.dart';
import 'screens/goals_screen.dart';
import 'screens/activities_screen.dart';
import 'screens/statistics_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Journal',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/diary': (context) => DiaryScreen(),
        '/goals': (context) => GoalsScreen(),
        '/activities': (context) => ActivitiesScreen(),
        '/statistics': (context) => StatisticsScreen(),
      },
    );
  }
}
