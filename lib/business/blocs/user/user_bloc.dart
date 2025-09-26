import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import '../../models/user.dart';
import '../../repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required UserRepository repository})
      : _repository = repository,
        super(UserInitial()) {
    on<LoadUsers>(_onLoadUsers);
    on<AddUser>(_onAddUser);
    on<RegisterUser>(_onRegisterUser);
    on<UpdateUser>(_onUpdateUser);
    on<DeleteUser>(_onDeleteUser);
    on<AuthenticateUser>(_onAuthenticateUser);
    on<SearchUsers>(_onSearchUsers);
    on<LogoutUser>(_onLogoutUser);
    on<SetCurrentUser>(_onSetCurrentUser);
    on<DeleteAccount>(_onDeleteAccount);
  }

  final UserRepository _repository;
  final Logger _logger = Logger('UserBloc');
  User? _currentUser;

  Future<void> _onLoadUsers(LoadUsers event, Emitter<UserState> emit) async {
    _logger.info('Loading users');
    emit(UserLoading());
    try {
      final users = await _repository.loadUsers();
      if (users.isNotEmpty && _currentUser == null) {
        _currentUser = users.first;
      }
      emit(UserLoaded(users, currentUser: _currentUser));
      _logger.info('Loaded ${users.length} users');
    } catch (e) {
      _logger.severe('Failed to load users: $e');
      emit(UserError(e.toString()));
    }
  }

  void _onAddUser(AddUser event, Emitter<UserState> emit) {
    _logger.info('Adding user: ${event.user.email}');
    if (state is UserLoaded) {
      final currentState = state as UserLoaded;
      final updatedUsers = List<User>.from(currentState.users)..add(event.user);
      _repository.saveUsers(updatedUsers);
      emit(UserLoaded(updatedUsers, currentUser: _currentUser));
      _logger.info('User added successfully');
    }
  }

  void _onRegisterUser(RegisterUser event, Emitter<UserState> emit) {
    _logger.info('Registering user: ${event.user.email}');
    if (state is UserLoaded) {
      final currentState = state as UserLoaded;
      final updatedUsers = List<User>.from(currentState.users)..add(event.user);
      _repository.saveUsers(updatedUsers);
      _currentUser = event.user;
      emit(UserLoaded(updatedUsers, currentUser: _currentUser));
      _logger.info('User registered successfully');
    }
  }

  void _onUpdateUser(UpdateUser event, Emitter<UserState> emit) {
    if (state is UserLoaded) {
      final currentState = state as UserLoaded;
      final updatedUsers = currentState.users.map((user) {
        return user.uid == event.uid ? event.updatedUser : user;
      }).toList();
      _repository.saveUsers(updatedUsers);
      final updatedCurrentUser = _currentUser?.uid == event.uid ? event.updatedUser : _currentUser;
      _currentUser = updatedCurrentUser;
      emit(UserLoaded(updatedUsers, currentUser: _currentUser));
    }
  }

  void _onDeleteUser(DeleteUser event, Emitter<UserState> emit) {
    if (state is UserLoaded) {
      final currentState = state as UserLoaded;
      final updatedUsers = currentState.users.where((user) => user.uid != event.uid).toList();
      _repository.saveUsers(updatedUsers);
      emit(UserLoaded(updatedUsers, currentUser: _currentUser));
    }
  }

  Future<void> _onAuthenticateUser(AuthenticateUser event, Emitter<UserState> emit) async {
    _logger.info('Authenticating user: ${event.email}');
    emit(UserLoading());
    try {
      final users = await _repository.loadUsers();
      final user = users.firstWhere(
        (u) => u.email == event.email && u.verifyPassword(event.password),
      );
      _currentUser = user;
      emit(UserLoaded(users, currentUser: _currentUser));
      _logger.info('User authenticated successfully');
    } catch (e) {
      _logger.warning('Authentication failed for ${event.email}: $e');
      emit(const UserError('Authentication failed'));
    }
  }

  void _onSearchUsers(SearchUsers event, Emitter<UserState> emit) {
    if (state is UserLoaded) {
      final currentState = state as UserLoaded;
      final filteredUsers = currentState.users.where((user) {
        final query = event.query.toLowerCase();
        return user.name.toLowerCase().contains(query) ||
               user.email.toLowerCase().contains(query);
      }).toList();
      emit(UserLoaded(filteredUsers, currentUser: _currentUser));
    }
  }

  void _onLogoutUser(LogoutUser event, Emitter<UserState> emit) {
    if (state is UserLoaded) {
      final currentState = state as UserLoaded;
      _currentUser = null;
      emit(UserLoaded(currentState.users, currentUser: _currentUser));
    }
  }

  void _onSetCurrentUser(SetCurrentUser event, Emitter<UserState> emit) {
    if (state is UserLoaded) {
      final currentState = state as UserLoaded;
      _currentUser = event.user;
      emit(UserLoaded(currentState.users, currentUser: _currentUser));
    }
  }

  Future<void> _onDeleteAccount(DeleteAccount event, Emitter<UserState> emit) async {
    _logger.info('Deleting user account');
    emit(UserLoading());
    try {
      await _repository.deleteUsersFile();
      _currentUser = null;
      emit(UserLoaded(const [], currentUser: _currentUser));
      _logger.info('Account deleted successfully');
    } catch (e) {
      _logger.severe('Failed to delete account: $e');
      emit(UserError(e.toString()));
    }
  }
}