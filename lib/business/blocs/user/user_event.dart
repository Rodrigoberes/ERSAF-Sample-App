part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUsers extends UserEvent {}

class AddUser extends UserEvent {

  const AddUser(this.user);
  final User user;

  @override
  List<Object> get props => [user];
}

class RegisterUser extends UserEvent {

  const RegisterUser(this.user);
  final User user;

  @override
  List<Object> get props => [user];
}

class UpdateUser extends UserEvent {

  const UpdateUser(this.uid, this.updatedUser);
  final String uid;
  final User updatedUser;

  @override
  List<Object> get props => [uid, updatedUser];
}

class DeleteUser extends UserEvent {

  const DeleteUser(this.uid);
  final String uid;

  @override
  List<Object> get props => [uid];
}

class AuthenticateUser extends UserEvent {

  const AuthenticateUser(this.email, this.password);
  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class SearchUsers extends UserEvent {

  const SearchUsers(this.query);
  final String query;

  @override
  List<Object> get props => [query];
}

class LogoutUser extends UserEvent {}

class SetCurrentUser extends UserEvent {

  const SetCurrentUser(this.user);
  final User user;

  @override
  List<Object> get props => [user];
}

class DeleteAccount extends UserEvent {}