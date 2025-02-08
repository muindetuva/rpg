import 'package:flutter/material.dart';
import 'package:rpg/shared/styled_text.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledHeading('Character Name'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // basic info
            // Weapon and ability
            // stats & skills
            // save button
          ],
        ),
      ),
    );
  }
}
