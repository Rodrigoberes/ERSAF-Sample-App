part of 'company_bloc.dart';

abstract class CompanyState extends Equatable {
  const CompanyState();

  @override
  List<Object> get props => [];
}

class CompanyInitial extends CompanyState {}

class CompanyLoading extends CompanyState {}

class CompanyLoaded extends CompanyState {

  const CompanyLoaded(this.company);
  final Company company;

  @override
  List<Object> get props => [company];
}

class CompanyError extends CompanyState {

  const CompanyError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}