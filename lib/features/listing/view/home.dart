import 'package:elearn/features/listing/view/widgets/course/course_list.dart';
import 'package:elearn/features/listing/view/widgets/header/header.dart';
import 'package:flutter/material.dart';
import 'widgets/header/filter_button.dart';
import 'widgets/header/slider.dart';


class TrainingCoursesScreen extends StatelessWidget {
  const TrainingCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              SliderWidget(),
              CourseList(),
            ],
          ),
        ),
      ),
    );
  }




}
