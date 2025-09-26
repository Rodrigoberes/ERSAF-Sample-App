import '../../services/api_service.dart';
import '../models/route.dart';

class RouteRepository {
  RouteRepository({required ApiService apiService}) : _apiService = apiService;
  
  final ApiService _apiService;

  Future<List<Route>> fetchRoutes() async {
    final result = await _apiService.fetchRoutes();
    return result.when(
      ok: (routes) => routes,
      err: (error) => throw Exception(error.message),
    );
  }
}