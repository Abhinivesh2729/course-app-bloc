part of 'filter_bloc.dart';

abstract class FilterEvent {}

class UpdateFilterSelections extends FilterEvent {
  final String optionName;
  final int filterType;

  UpdateFilterSelections(this.optionName, this.filterType);
}

class UpdateSelectedFilter extends FilterEvent {
  final int index;

  UpdateSelectedFilter(this.index);
}

class InitializeFilters extends FilterEvent {
  final List<Filter> filters;

  InitializeFilters(this.filters);
}