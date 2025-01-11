import 'package:elearn/core/constants.dart';
import 'package:elearn/core/extensions/seperator/model.dart';
import 'package:elearn/features/course/data/course.dart';
import 'package:elearn/features/enrol/view/enrol.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../core/extensions/seperator/seperator.dart' as seperator;
import '../header/carousel_card.dart';

class CourseCard extends StatelessWidget {
  final List<Course> courses;

  const CourseCard({
    super.key,
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            courses.length,
            (index) => CourseTile(
              isFillingFast: index % 2 == 0 ,
              isEarlyBird: index % 2 != 0,
              course: courses[index],
            ),
          )
        ],
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  const CourseTile({
    super.key,
    required this.isFillingFast,
    required this.isEarlyBird,
    required this.course,
  });
  final Course course;
  final bool isFillingFast;
  final bool isEarlyBird;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Oct 19 - 21,\n2025',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
                Text(
                  formatTimeRange(course.duration),
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 10),
                ),
                SizedBox(height: 2),
                Text(
                  "Convention Hall,\n"+course.location,
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
          ),
          //divider
          seperator.Divider(color: Colors.grey,orientation: DividerOrientation.VERTICAL, style: DividerStyle.DASHED,),
          //course author info
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isFillingFast)
                  const Text(
                    'Filling Fast!',
                    style: TextStyle(
                      color: APP_CONSTANTS.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                    ),
                  )
                else if (isEarlyBird)
                  const Text(
                    'Early Bird!',
                    style: TextStyle(
                      color: APP_CONSTANTS.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                    ),
                  ),
                Text(
                  course.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/learn.jpg'),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Keynote Speaker',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          course.trainer.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.58,
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EnrolmentScreen(course: course))),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                      backgroundColor: APP_CONSTANTS.primaryColor,
                    ),
                    child: const Text('Enrol Now',style: TextStyle(color: Colors.white,fontSize: 14, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String formatTimeRange(CourseDuration duration) {
  final DateFormat timeFormatter = DateFormat('hh:mm a');
  return '${timeFormatter.format(duration.from).toLowerCase()} - ${timeFormatter.format(duration.to).toLowerCase()}';
}
