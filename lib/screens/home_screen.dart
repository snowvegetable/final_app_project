import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('生活日記'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/diary');
              },
              child: Text('寫日記'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/goals');
              },
              child: Text('設立目標'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/activities');
              },
              child: Text('追蹤活動'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/statistics');
              },
              child: Text('查看統計資料'),
            ),
          ],
        ),
      ),
    );
  }
}
