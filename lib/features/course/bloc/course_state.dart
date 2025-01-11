part of 'course_bloc.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {
  final List<Course> courses;

  CourseInitial({required this.courses});
}

final class LoadedCourseState extends CourseState {
  final List<Course> courses;

  LoadedCourseState({required this.courses});
}
