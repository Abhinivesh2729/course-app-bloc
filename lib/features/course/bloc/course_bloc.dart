import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:elearn/core/constants.dart';
import 'package:elearn/features/course/data/course.dart';
import 'package:flutter/material.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  List<Course> courses = APP_CONSTANTS.courses;

  CourseBloc() : super(CourseInitial(courses: APP_CONSTANTS.courses)) {
    on<LoadCourseEvent>((event, emit) {
      emit(LoadedCourseState(courses: courses));
    });

    //filter
    on<FilterCourseEvent>((event, emit) {
      log("Selected Locations ${event.locations}\nSelected Course Names ${event.courseName}\nSelected Trainers ${event.trainers}");
      List<Course> filteredCourses = courses;
      log("${event.locations.isNotEmpty} ${event.courseName.isNotEmpty} ${event.trainers.isNotEmpty}");
      // only apply filters if they are not empty
      if (event.locations.isNotEmpty || event.courseName.isNotEmpty || event.trainers.isNotEmpty) {
        filteredCourses = courses.where((course) {
          bool shouldInclude = true;
         //apply location filter if locations are selected
          if (event.locations.isNotEmpty) {
            log("Apply location filter if locations are selected");
            shouldInclude = shouldInclude && event.locations.contains(course.location);
          }
           //Apply course name filter if course names are selected
          if (event.courseName.isNotEmpty) {
            log("Apply course name filter if course names are selected");
            shouldInclude = shouldInclude && event.courseName.contains(course.name);
          }
         //apply trainer filter if trainers are selected
          if (event.trainers.isNotEmpty) {
            log("Apply trainer filter if trainers are selected");
            shouldInclude = shouldInclude && event.trainers.contains(course.trainer.name);
          }

          return shouldInclude;
        }).toList();
      }

      emit(LoadedCourseState(courses: filteredCourses.toList()));
    });
  }
}
