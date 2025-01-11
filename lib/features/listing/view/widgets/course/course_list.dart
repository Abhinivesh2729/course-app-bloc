import 'package:elearn/core/constants.dart';
import 'package:elearn/features/course/bloc/course_bloc.dart';
import 'package:elearn/features/listing/view/widgets/header/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'course_card.dart';



class CourseList extends StatefulWidget {
  const CourseList({
    super.key,
  });

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CourseBloc>(context).add(LoadCourseEvent());
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
      builder: (context, state) {
        if (state is LoadedCourseState) {
          return CourseCard(courses: state.courses);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
