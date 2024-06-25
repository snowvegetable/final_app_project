// lib/screens/goals_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _saveGoal() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('goal', _goalController.text);
    await prefs.setString('goalDescription', _descriptionController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('目標已保存')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設立目標'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _goalController,
              decoration: InputDecoration(labelText: '目標'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: '描述'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveGoal,
              child: Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}
