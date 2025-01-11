part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

class LoadCourseEvent extends CourseEvent {}


class FilterCourseEvent extends CourseEvent {
  final List<String> locations;
  final List<String> courseName;
  final List<String> trainers;

  FilterCourseEvent({required this.locations, required this.courseName, required this.trainers});

}
