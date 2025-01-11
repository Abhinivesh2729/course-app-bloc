import 'package:flutter/material.dart';

class Filter {
  final String name;
  final List<Widget> Function() filterOptions;

  Filter({required this.name, required this.filterOptions});
}