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
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  // getters
  bool get isFav => _isFav;
}
