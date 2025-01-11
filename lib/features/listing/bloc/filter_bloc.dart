import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/filter_model.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState()) {
    on<UpdateFilterSelections>(handleUpdateFilterSelections);
    on<UpdateSelectedFilter>(handleUpdateSelectedFilter);
    on<InitializeFilters>(handleInitializeFilters);
  }


  //handlers

  void handleUpdateFilterSelections( UpdateFilterSelections event, Emitter<FilterState> emit) {
    switch (event.filterType) {
      case 1:
        final locations = Set<String>.from(state.selectedLocations);
        if (locations.contains(event.optionName)) {
          locations.remove(event.optionName);
        } else {
          locations.add(event.optionName);
        }
        emit(state.copyWith(selectedLocations: locations));
        break;
      case 2:
        final courseNames = Set<String>.from(state.selectedCourseNames);
        if (courseNames.contains(event.optionName)) {
          courseNames.remove(event.optionName);
        } else {
          courseNames.add(event.optionName);
        }
        emit(state.copyWith(selectedCourseNames: courseNames));
        break;
      case 3:
        final trainers = Set<String>.from(state.selectedTrainers);
        if (trainers.contains(event.optionName)) {
          trainers.remove(event.optionName);
        } else {
          trainers.add(event.optionName);
        }
        emit(state.copyWith(selectedTrainers: trainers));
        break;
    }
  }

  void handleUpdateSelectedFilter(
    UpdateSelectedFilter event,
    Emitter<FilterState> emit,
  ) {
    emit(state.copyWith(selectedFilter: event.index));
  }

  void handleInitializeFilters(
    InitializeFilters event,
    Emitter<FilterState> emit,
  ) {
    log("Received filters length => ${event.filters.length}");
    emit(state.copyWith(filters: event.filters));
  }
}

