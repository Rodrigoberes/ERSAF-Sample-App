import '../../services/api_service.dart';
import '../models/company.dart';

class CompanyRepository {
  CompanyRepository({required ApiService apiService}) : _apiService = apiService;

  final ApiService _apiService;

  Future<Company> fetchCompany(int id) async {
    final result = await _apiService.fetchCompany(id);
    return result.when(
      ok: (company) => company,
      err: (error) => throw Exception(error.message),
    );
  }
}