import 'dart:async';
import 'dart:developer';

import 'package:elearn/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../course/bloc/course_bloc.dart';
import '../../../bloc/filter_bloc.dart';
import '../../../data/filter_model.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}



class _FilterBottomSheetState extends State<FilterBottomSheet> {
  


  void initFilters() {
      BlocProvider.of<FilterBloc>(context).add(
        InitializeFilters(
         [
              Filter(name: "Sort", filterOptions: () => [Container()]),
              Filter(name: "Location", filterOptions: () => APP_CONSTANTS.courses.map((course) => filterOptionWidget(course.location)).toSet().toList()),
              Filter(name: "Traning Name", filterOptions: () => APP_CONSTANTS.courses.map((course) => filterOptionWidget(course.name)).toSet().toList()),
              Filter(name: "Trainer", filterOptions: () => APP_CONSTANTS.trainers.map((trainer) => filterOptionWidget(trainer.name)).toSet().toList())
        ]      
        )
      );
    
  }


  
  @override
  void initState() {
    initFilters();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    log(BlocProvider.of<FilterBloc>(context).state.filters.length.toString() + " Filters");
      return BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
        if(state.filters.isNotEmpty) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(1)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sort and Filters',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, size: 24),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //filter options menu
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // list of filter menu
                    ...List.generate(state.filters.length, (index) => 
                    GestureDetector(
                      onTap: () {
                          BlocProvider.of<FilterBloc>(context).add(UpdateSelectedFilter(index));
                        },
                      child: Container(
                        decoration: BoxDecoration(
                          color: state.selectedFilter == index ? Colors.white : Colors.grey[100],
                          border: state.selectedFilter == index ? Border(left: BorderSide(color: APP_CONSTANTS.primaryColor, width: 5)) : Border()
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 26, vertical: 22),
                        width: double.infinity,
                        child: Text(
                        state.filters[index].name,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                                              )
                      ),
                    ),),

                  ],
                ),
              ),
              //filter options
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  children: [
                    // Search Field
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                        ),
                      ),
                    ),
                    // filter options select
                        Container(
                          color: Colors.white,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Text(
                                    state.filters[state.selectedFilter].name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                // location options
                                ...state.filters[state.selectedFilter].filterOptions()
                              ],
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
        } else {
          return Center(child: Text("Loading.."));
        }
        },
      );
  }

  Widget filterOptionWidget(String optionName) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Checkbox(
                value: state.selectedCourseNames.union(state.selectedLocations).union(state.selectedTrainers).contains(optionName),
                onChanged: (value) {
                  BlocProvider.of<FilterBloc>(context).add(UpdateFilterSelections(optionName, state.selectedFilter));
                  switch (state.selectedFilter) {
                    case 1: BlocProvider.of<CourseBloc>(context).add(FilterCourseEvent(locations: value! ? (state.selectedLocations.union({optionName})).toList() : (state.selectedLocations.difference({optionName})).toList(), courseName: state.selectedCourseNames.toList(), trainers: state.selectedTrainers.toList()));
                    case 2: BlocProvider.of<CourseBloc>(context).add(FilterCourseEvent(locations: state.selectedLocations.toList(), courseName: value! ? (state.selectedCourseNames.union({optionName})).toList() : (state.selectedCourseNames.difference({optionName})).toList(), trainers: state.selectedTrainers.toList()));
                    case 3: BlocProvider.of<CourseBloc>(context).add(FilterCourseEvent(locations: state.selectedLocations.toList(), courseName: state.selectedCourseNames.toList(), trainers: value! ? (state.selectedTrainers.union({optionName})).toList() : (state.selectedTrainers.difference({optionName})).toList()));
                  }
                },
                activeColor: Colors.red,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              Text(
                optionName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  
}
