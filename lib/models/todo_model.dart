import 'package:hive_flutter/hive_flutter.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 1)
class TodoModel extends HiveObject {

 @HiveField(0)
  String? tittle;
  @HiveField(1)
  bool isCompleted = false;

  TodoModel({required this.tittle, required this.isCompleted});
}


