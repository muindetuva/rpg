import 'package:flutter/material.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: StyledTitle("Character Creation"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              // Welcome message
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              Center(
                child: StyledHeading("Welcome New Player"),
              ),
              Center(
                child: StyledText("Create a name & slogan fro your character"),
              ),
              SizedBox(height: 30),
            ],
          ),
        ));
  }
}
