import 'package:flutter/material.dart';
import 'package:rpg/screens/create/create.dart';
import 'package:rpg/screens/home/home.dart';
import 'package:rpg/theme.dart';

void main() {
  runApp(MaterialApp(theme: primaryTheme, home: Home()));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sandbox'),
        backgroundColor: Colors.grey,
      ),
      body: Text("Sandbox"),
    );
  }
}
