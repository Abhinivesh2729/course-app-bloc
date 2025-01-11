import 'package:elearn/core/constants.dart';
import 'package:elearn/features/listing/view/widgets/header/filter_button.dart';
import 'package:flutter/material.dart';

import 'carousel_card.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(color: Colors.white),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: const BoxDecoration(color: APP_CONSTANTS.primaryColor),
        ),

        //carousel
        Container(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: Text("Highlights",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //buttons
                  GestureDetector(
                    onTap: () {
                      controller.previousPage(duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.6),
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  CarouselCard(courses: APP_CONSTANTS.courses,),

                  //buttons
                  GestureDetector(
                    onTap: () {
                      controller.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.6),
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              FilterButton(),
            ],
          ),
        ),
      ],
    );
  }
}
