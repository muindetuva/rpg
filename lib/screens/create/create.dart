import 'package:flutter/material.dart';
import 'package:rpg/models/vocation.dart';
import 'package:rpg/screens/create/vocation_card.dart';
import 'package:rpg/shared/styled_button.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // submit handler
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      // some error
      print("Name must not be empty");
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      // some error
      print("Slogan must not be empty");
      return;
    }

    print(_nameController.text);
    print(_sloganController.text);
  }

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

              // Input for name and slogan
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText("Character name"),
                ),
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText("Character slogan"),
                ),
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
              ),
              SizedBox(height: 30),
              // Select vocation title
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              Center(
                child: StyledHeading("Choose a vocation"),
              ),
              Center(
                child: StyledText("This determines your available skills"),
              ),
              SizedBox(height: 30),

              // vocation cards
              VocationCard(vocation: Vocation.junkie),
              VocationCard(vocation: Vocation.ninja),
              VocationCard(vocation: Vocation.raider),
              VocationCard(vocation: Vocation.wizard),

              Center(
                child: StyledButton(
                    onPressed: handleSubmit,
                    child: StyledHeading("Create Character")),
              ),
            ],
          ),
        ));
  }
}
