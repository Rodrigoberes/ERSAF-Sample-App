part of 'company_bloc.dart';

abstract class CompanyEvent extends Equatable {
  const CompanyEvent();

  @override
  List<Object> get props => [];
}

class LoadCompany extends CompanyEvent {

  const LoadCompany(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}