import 'package:flutter/material.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/models/vocation.dart';
import 'package:rpg/screens/create/vocation_card.dart';
import 'package:rpg/screens/home/home.dart';
import 'package:rpg/shared/styled_button.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

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

  // handling vocation selection
  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  // submit handler
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      // some error

      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
            
              title: const StyledHeading("Missing Character Name"),
              content:
                  StyledText("Every good RPG character needs a great name..."),
              actions: [
                StyledButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: StyledHeading('close'))
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });

      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              
              title: const StyledHeading("Missing Slogan"),
              content: StyledText("Remember to add a catchy slogan.."),
              actions: [
                StyledButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: StyledHeading('close'))
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });

      return;
    }

    characters.add(
      Character(
        name: _nameController.text,
        slogan: _sloganController.text,
        vocation: selectedVocation,
        id: uuid.v4(),
      ),
    );

    // Navigate back to home screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => Home()),
    );
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
          child: SingleChildScrollView(
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
                  child:
                      StyledText("Create a name & slogan fro your character"),
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
                VocationCard(
                  selected: selectedVocation == Vocation.junkie,
                  onTap: updateVocation,
                  vocation: Vocation.junkie,
                ),
                VocationCard(
                  selected: selectedVocation == Vocation.ninja,
                  onTap: updateVocation,
                  vocation: Vocation.ninja,
                ),
                VocationCard(
                  selected: selectedVocation == Vocation.raider,
                  onTap: updateVocation,
                  vocation: Vocation.raider,
                ),
                VocationCard(
                  selected: selectedVocation == Vocation.wizard,
                  onTap: updateVocation,
                  vocation: Vocation.wizard,
                ),

                // Select vocation title
                Center(
                  child: Icon(
                    Icons.code,
                    color: AppColors.primaryColor,
                  ),
                ),
                Center(
                  child: StyledHeading("Good Luck"),
                ),
                Center(
                  child: StyledText("And Enjoy the journey..."),
                ),
                SizedBox(height: 20),

                Center(
                  child: StyledButton(
                      onPressed: handleSubmit,
                      child: StyledHeading("Create Character")),
                ),
              ],
            ),
          ),
        ));
  }
}
