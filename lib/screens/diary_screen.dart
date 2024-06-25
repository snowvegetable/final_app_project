// lib/screens/diary_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiaryScreen extends StatefulWidget {
  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  Future<void> _saveDiary() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('diaryTitle', _titleController.text);
    await prefs.setString('diaryContent', _contentController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('日記已保存')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('寫日記'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: '標題'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: '內容'),
              maxLines: 10,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveDiary,
              child: Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}
