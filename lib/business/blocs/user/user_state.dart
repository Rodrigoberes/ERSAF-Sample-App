part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {

  const UserLoaded(this.users, {this.currentUser});
  final List<User> users;
  final User? currentUser;

  @override
  List<Object> get props => [users, currentUser ?? ''];
}

class UserError extends UserState {

  const UserError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}