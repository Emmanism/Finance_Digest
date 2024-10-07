import 'package:hive/hive.dart';

part 'user_data.g.dart';

@HiveType(typeId: 0) 
class UserData {
  @HiveField(0) 
  String firstName;

  @HiveField(1) 
  String lastName;

  UserData({required this.firstName, required this.lastName});
}