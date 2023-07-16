
import 'package:hive/hive.dart';
part "notes_model.g.dart";

@HiveType(typeId: 0)
class notes_model{
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  int id;

  notes_model({required this.date, required this.title, required this.description, required this.id});
}


