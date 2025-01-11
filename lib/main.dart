import 'package:elearn/features/course/bloc/course_bloc.dart';
import 'package:elearn/features/listing/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/listing/bloc/filter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CourseBloc(),
        ),
        BlocProvider(
          create: (context) => FilterBloc(),
        ),
      ],
      child: MaterialApp(title: 'Material App', home: TrainingCoursesScreen()),
    );
  }
}
