import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oxidized/oxidized.dart';

import '../business/models/app_error.dart';
import '../business/models/company.dart';
import '../business/models/route.dart';
import 'assets_service.dart';

class ApiService {
  const ApiService({required Dio client, required AssetsService assetsService})
    : _client = client,
      _assetsService = assetsService;

  final Dio _client;
  final AssetsService _assetsService;

  Future<Result<List<Company>, AppError>> fetchCompanies() async {
    final apiUrlResult = await _assetsService.fetchApiUrl();
    if (apiUrlResult.isErr()) {
      return Err(apiUrlResult.unwrapErr());
    }
    final baseUrl = apiUrlResult.unwrap();

    final sb = StringBuffer();
    sb.write(baseUrl);
    sb.write('/companies');

    final uri = Uri.parse(sb.toString());

    final Response<String> response;

    try {
      response = await _client.getUri<String>(uri);
    } catch (e) {
      return Err(AppError('Network error: ${e.toString()}'));
    }

    final status = response.statusCode;
    final body = response.data;

    if (status == null || status != HttpStatus.ok || body == null) {
      return Err(AppError('Could not fetch companies: empty body $body'));
    }

    final List<dynamic> json;

    try {
      json = jsonDecode(body) as List<dynamic>;
    } catch (e) {
      return Err(
        AppError('Could not JSON decode companies data $body: ${e.toString()}'),
      );
    }

    try {
      return Ok(
        json
            .map((item) => Company.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return Err(AppError('Could not parse companies data: ${e.toString()}'));
    }
  }

  Future<Result<Company, AppError>> fetchCompany(int id) async {
    final apiUrlResult = await _assetsService.fetchApiUrl();
    if (apiUrlResult.isErr()) {
      return Err(apiUrlResult.unwrapErr());
    }
    final baseUrl = apiUrlResult.unwrap();

    final sb = StringBuffer();
    sb.write(baseUrl);
    sb.write('/companies/$id');

    final uri = Uri.parse(sb.toString());

    final Response<String> response;

    try {
      response = await _client.getUri<String>(uri);
    } catch (e) {
      return Err(AppError('Network error: ${e.toString()}'));
    }

    final status = response.statusCode;
    final body = response.data;

    if (status == null || status != HttpStatus.ok || body == null) {
      return Err(AppError('Could not fetch company: empty body $body'));
    }

    final Map<String, dynamic> json;

    try {
      json = jsonDecode(body) as Map<String, dynamic>;

    } catch (e) {
     
      return Err(
        AppError('Could not JSON decode company data $body: ${e.toString()}'),
      );
    }

    try {
      final company = Company.fromJson(json);
      return Ok(company);
    } catch (e) {
      return Err(AppError('Could not parse company data: ${e.toString()}'));
    }
  }

  Future<Result<List<Route>, AppError>> fetchRoutes() async {
    final apiUrlResult = await _assetsService.fetchApiUrl();
    if (apiUrlResult.isErr()) {
      return Err(apiUrlResult.unwrapErr());
    }
    final baseUrl = apiUrlResult.unwrap();

    final sb = StringBuffer();
    sb.write(baseUrl);
    sb.write('/routes');

    final uri = Uri.parse(sb.toString());

    final Response<String> response;

    try {
      response = await _client.getUri<String>(uri);
    } catch (e) {  
      return Err(AppError('Network error: ${e.toString()}'));
    }

    final status = response.statusCode;
    final body = response.data;

    if (status == null || status != HttpStatus.ok || body == null) {
      return Err(AppError('Could not fetch routes: empty body $body'));
    }

    final List<dynamic> json;

    try {
      json = jsonDecode(body) as List<dynamic>;
    } catch (e) {
      return Err(
        AppError('Could not JSON decode routes data $body: ${e.toString()}'),
      );
    }

    try {
      return Ok(
        json
            .map((item) => Route.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return Err(AppError('Could not parse routes data: ${e.toString()}'));
    }
  }
}