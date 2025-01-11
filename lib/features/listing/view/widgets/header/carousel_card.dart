import 'package:elearn/features/course/data/course.dart';
import 'package:elearn/features/enrol/view/enrol.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'banner_pricing.dart';

class CarouselCard extends StatefulWidget {
  final List<Course> courses;
  const CarouselCard({
    super.key,
    required this.courses,
  });

  @override
  State<CarouselCard> createState() => _CarouselCardState();
}
final PageController controller = PageController(viewportFraction: 1);
class _CarouselCardState extends State<CarouselCard> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.25,
      child: PageView.builder(
        controller: controller,
        itemCount: widget.courses.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              image: DecorationImage(
                image: AssetImage(widget.courses[index].poster),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.courses[index].name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${widget.courses[index].location} - ${formatDateRange(widget.courses[index].duration)}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BannerPricing(
                            price: widget.courses[index].price,
                          ),
                          TextButton(
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EnrolmentScreen(course: widget.courses[index]))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'View Details ',
                                  style: TextStyle(color: Colors.grey.shade300),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.grey.shade300,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

String formatDateRange(CourseDuration duration) {
  final DateFormat formatter = DateFormat('MMM d');
  return '${formatter.format(duration.from)} - ${formatter.format(duration.to)}';
}
