import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _textColor = Colors.black;
  bool _isTextVisible = true;

  void _changeTextColor() {
    setState(() {
      _textColor = Color(
        (Random().nextDouble() * 0xFFFFFF).toInt(),
      ).withOpacity(1.0);
    });
  }

  void _exitApp() {
    Future.delayed(Duration(milliseconds: 500), () {
      Navigator.of(context).pop(true);
    });
  }

  void _toggleTextVisibility() {
    setState(() {
      _isTextVisible = !_isTextVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Assignment 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isTextVisible)
              Text(
                'Hello World',
                style: TextStyle(fontSize: 24, color: _textColor),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeTextColor,
              child: Text('Change Text Color'),
            ),
            ElevatedButton(
              onPressed: _toggleTextVisibility,
              child: Text(_isTextVisible ? 'Remove Text' : 'Show Text'),
            ),
            ElevatedButton(onPressed: _exitApp, child: Text('Exit App')),
          ],
        ),
      ),
    );
  }
}
