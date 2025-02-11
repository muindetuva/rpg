import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/screens/profile/skill_list.dart';
import 'package:rpg/screens/profile/stats_table.dart';
import 'package:rpg/services/character_store.dart';
import 'package:rpg/shared/styled_button.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledHeading(character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // basic info
            Container(
              padding: EdgeInsets.all(16),
              color: AppColors.secondaryColor.withValues(alpha: 0.3),
              child: Row(
                children: [
                  Hero(
                    tag: character.id.toString(),
                    child: Image.asset(
                      'assets/img/vocations/${character.vocation.image}',
                      width: 140,
                      height: 140,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(character.vocation.title),
                        StyledText(character.vocation.description)
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Weapon and ability
            SizedBox(height: 20),
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                color: AppColors.secondaryColor.withValues(alpha: 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeading('Slogan'),
                    StyledText(character.slogan),
                    SizedBox(height: 10),
                    StyledHeading('Weapon of Choice'),
                    StyledText(character.vocation.weapon),
                    SizedBox(height: 10),
                    StyledHeading('Unique Ability'),
                    StyledText(character.vocation.ability),
                  ],
                ),
              ),
            ),
            // stats & skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(character),
                  SkillList(character),
                ],
              ),
            ),
            // save button
            StyledButton(
              onPressed: () {
                Provider.of<CharacterStore>(context, listen: false)
                    .saveCharacter(character);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: StyledHeading("Character Saved."),
                    showCloseIcon: true,
                    duration: Duration(seconds: 2),
                    backgroundColor: AppColors.secondaryColor,
                  ),
                );
              },
              child: StyledHeading('Save Character'),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
