import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/route.dart';
import '../../repositories/route_repository.dart';

part 'route_event.dart';
part 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {

  RouteBloc({required RouteRepository repository})
      : _repository = repository,
        super(RouteInitial()) {
    on<LoadRoutes>(_onLoadRoutes);
    on<SearchRoutes>(_onSearchRoutes);
    on<FilterRoutesByDate>(_onFilterRoutesByDate);
  }
  final RouteRepository _repository;
  List<Route> _allRoutes = [];

  Future<void> _onLoadRoutes(LoadRoutes event, Emitter<RouteState> emit) async {
    emit(RouteLoading());
    try {
      final routes = await _repository.fetchRoutes();
      _allRoutes = routes;
      emit(RouteLoaded(routes));
    } catch (e) {
      emit(RouteError(e.toString()));
    }
  }

  void _onSearchRoutes(SearchRoutes event, Emitter<RouteState> emit) {
    if (state is RouteLoaded) {
      final filteredRoutes = _allRoutes.where((route) {
        final query = event.query.toLowerCase();
        return route.originCity.toLowerCase().contains(query) ||
                route.destinationCity.toLowerCase().contains(query) ||
                route.originTerminal.toLowerCase().contains(query) ||
                route.destinationTerminal.toLowerCase().contains(query);
      }).toList();
      emit(RouteLoaded(filteredRoutes, searchQuery: event.query));
    }
  }

  void _onFilterRoutesByDate(FilterRoutesByDate event, Emitter<RouteState> emit) {
    if (state is RouteLoaded) {
      final currentState = state as RouteLoaded;
      // For now, just filter by routes that could be available on the selected date
      // In a real app, you'd check against schedules
      emit(RouteLoaded(currentState.routes, selectedDate: event.date));
    }
  }
}