import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/company.dart';
import '../../repositories/company_repository.dart';

part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {

  CompanyBloc({required CompanyRepository repository})
      : _repository = repository,
        super(CompanyInitial()) {
    on<LoadCompany>(_onLoadCompany);
  }
  final CompanyRepository _repository;

  Future<void> _onLoadCompany(LoadCompany event, Emitter<CompanyState> emit) async {
    emit(CompanyLoading());
    try {
      final company = await _repository.fetchCompany(event.id);
      emit(CompanyLoaded(company));
    } catch (e) {
      final company = Company(
        id: 0,
        name: 'Unknown Company',
        cuit: '',
        phone: '',
        email: '',
        address: '',
        icon: '',
        isActive: false,
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
      );
      emit(CompanyLoaded(company));
    }
  }
}