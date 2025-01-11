import 'package:elearn/core/constants.dart';
import 'package:elearn/features/course/data/course.dart';
import 'package:flutter/material.dart';

class EnrolmentScreen extends StatelessWidget {
  final Course course;
  const EnrolmentScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(course.name, style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: APP_CONSTANTS.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            //image
            Expanded(child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(course.poster),fit: BoxFit.cover)
              ),
            )),

            Expanded(child: Column(
              children: [
                //title
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Text(course.name, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                ),

                //athor
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    leading: Container(height: 50, width: 50,decoration: BoxDecoration(image: DecorationImage(image: AssetImage(course.trainer.profilePic),fit: BoxFit.cover),shape: BoxShape.circle),),
                    title: Text(course.trainer.name, style: TextStyle(fontSize: 18),textAlign: TextAlign.start,),
                    subtitle: Text(course.location, style: TextStyle(fontSize: 16),textAlign: TextAlign.start,),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}