part of 'route_bloc.dart';

abstract class RouteState extends Equatable {
  const RouteState();

  @override
  List<Object> get props => [];
}

class RouteInitial extends RouteState {}

class RouteLoading extends RouteState {}

class RouteLoaded extends RouteState {

  const RouteLoaded(this.routes, {this.searchQuery, this.selectedDate});
  final List<Route> routes;
  final String? searchQuery;
  final DateTime? selectedDate;

  @override
  List<Object> get props => [routes, searchQuery ?? '', selectedDate ?? DateTime.now()];
}

class RouteError extends RouteState {

  const RouteError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}