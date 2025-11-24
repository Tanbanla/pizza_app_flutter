import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza App Test',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pizza App Test'),
        ),
        body: Center(
          child: Text(
            'iOS Build Test - Success!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}