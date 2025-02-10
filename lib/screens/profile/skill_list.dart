import 'package:flutter/material.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/models/skill.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> availableSkills;
  late Skill selectedSkill;

  @override
  void initState() {
    availableSkills = allSkills.where((skill) {
      return skill.vocation == widget.character.vocation;
    }).toList();

    if (widget.character.skills.isEmpty) {
      selectedSkill = availableSkills[0];
    } else {
      selectedSkill = widget.character.skills.first;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        color: AppColors.secondaryColor.withValues(alpha: 0.5),
        child: Column(
          children: [
            StyledHeading("Choose an active skill"),
            StyledText("Sklls are unique to your vocation."),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: availableSkills.map((skill) {
                return Container(
                  color: skill == selectedSkill
                      ? Colors.yellow
                      : Colors.transparent,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(2),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.character.updateSkill(skill);
                        selectedSkill = skill;
                      });
                    },
                    child: Image.asset(
                      'assets/img/skills/${skill.image}',
                      width: 65,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            StyledText(selectedSkill.name)
          ],
        ),
      ),
    );
  }
}
