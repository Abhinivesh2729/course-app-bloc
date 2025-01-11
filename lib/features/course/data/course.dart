import 'package:elearn/features/course/data/tutor.dart';

class Course {
  final String id;
  final String name;
  final String location;
  final CourseDuration duration;
  final Trainer trainer;
  final int price;
  final String poster;

  Course(  {required this.poster,required this.price,required this.id, required this.name, required this.location, required this.duration, required this.trainer});

}

class CourseDuration {
  final DateTime from;
  final DateTime to;

  CourseDuration({required this.from, required this.to});
}