part of 'route_bloc.dart';

abstract class RouteEvent extends Equatable {
  const RouteEvent();

  @override
  List<Object> get props => [];
}

class LoadRoutes extends RouteEvent {}

class SearchRoutes extends RouteEvent {

  const SearchRoutes(this.query);
  final String query;

  @override
  List<Object> get props => [query];
}

class FilterRoutesByDate extends RouteEvent {

  const FilterRoutesByDate(this.date);
  final DateTime date;

  @override
  List<Object> get props => [date];
}