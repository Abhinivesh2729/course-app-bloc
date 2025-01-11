part of 'filter_bloc.dart';

class FilterState {
  final Set<String> selectedLocations;
  final Set<String> selectedCourseNames;
  final Set<String> selectedTrainers;
  final int selectedFilter;
  final List<Filter> filters;

  FilterState({
    this.selectedLocations = const {},
    this.selectedCourseNames = const {},
    this.selectedTrainers = const {},
    this.selectedFilter = 0,
    this.filters = const [],
  });

  FilterState copyWith({
    Set<String>? selectedLocations,
    Set<String>? selectedCourseNames,
    Set<String>? selectedTrainers,
    int? selectedFilter,
    List<Filter>? filters,
  }) {
    return FilterState(
      selectedLocations: selectedLocations ?? this.selectedLocations,
      selectedCourseNames: selectedCourseNames ?? this.selectedCourseNames,
      selectedTrainers: selectedTrainers ?? this.selectedTrainers,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      filters: filters ?? this.filters,
    );
  }
}
