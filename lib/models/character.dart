import 'package:rpg/models/skill.dart';
import 'package:rpg/models/stats.dart';
import 'package:rpg/models/vocation.dart';

class Character with Stats {
// constructor
  Character(
      {required this.name,
      required this.slogan,
      required this.vocation,
      required this.id});

  // fields
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

// methods
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

// character to firestore (map)
  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "slogan": slogan,
      "isFav": _isFav,
      "vocation": vocation.toString(),
      "skills": skills.map((skill) => skill.id).toList(),
      'stats': statsAsMap,
      'poins': points
    };
  }



  // getters
  bool get isFav => _isFav;
}
