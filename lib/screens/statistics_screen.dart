// lib/screens/statistics_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  String diaryTitle = '';
  String diaryContent = '';
  String goal = '';
  String goalDescription = '';
  String activity = '';
  String activityDescription = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      diaryTitle = prefs.getString('diaryTitle') ?? '';
      diaryContent = prefs.getString('diaryContent') ?? '';
      goal = prefs.getString('goal') ?? '';
      goalDescription = prefs.getString('goalDescription') ?? '';
      activity = prefs.getString('activity') ?? '';
      activityDescription = prefs.getString('activityDescription') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('查看統計資料'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('日記標題: $diaryTitle'),
            Text('日記內容: $diaryContent'),
            SizedBox(height: 20),
            Text('目標: $goal'),
            Text('目標描述: $goalDescription'),
            SizedBox(height: 20),
            Text('活動: $activity'),
            Text('活動描述: $activityDescription'),
          ],
        ),
      ),
    );
  }
}
