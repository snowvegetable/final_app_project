// lib/screens/activities_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivitiesScreen extends StatefulWidget {
  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  final TextEditingController _activityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _saveActivity() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('activity', _activityController.text);
    await prefs.setString('activityDescription', _descriptionController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('活動已保存')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('追蹤活動'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _activityController,
              decoration: InputDecoration(labelText: '活動'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: '描述'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveActivity,
              child: Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}
