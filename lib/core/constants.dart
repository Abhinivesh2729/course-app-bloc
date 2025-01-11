import 'package:elearn/features/course/data/course.dart';
import 'package:elearn/features/course/data/tutor.dart';
import 'package:flutter/material.dart';



class APP_CONSTANTS {
  static const Color primaryColor = Colors.red;
  static  List<Trainer> trainers =  [
    Trainer(id: "1", name: "Helen Gribbie", profilePic: "assets/learn.jpg"),
    Trainer(id: "2", name: "Issac Newton", profilePic: "assets/learn.jpg"),
    Trainer(id: "3", name: "Nikola Tesla", profilePic: "assets/learn.jpg"),
  ];
  
 
  static  List<Course> courses  = [
    Course(id: "1",duration: CourseDuration(from: from, to: to), trainer: trainers[0], name: "Safe Scrum Master",  poster: "assets/learn.jpg", location: "San Fransisco, CA", price: 200),
    Course(id: "2",duration: CourseDuration(from: from, to: to), trainer: trainers[0], name: "Agile in a nutshell",  poster: "assets/learn.jpg", location: "New York, ZK", price: 499),
    Course(id: "3",duration: CourseDuration(from: from, to: to), trainer: trainers[1], name: "Humors on Management",  poster: "assets/learn.jpg", location: "Dallas, TX", price: 650),
    Course(id: "4",duration: CourseDuration(from: from, to: to), trainer: trainers[2], name: "Exausted developer",  poster: "assets/learn.jpg", location: "Chicago, IL", price: 199)
  ];
}




DateTime to = from.add(const Duration(days: 2));
DateTime from = DateTime.now();