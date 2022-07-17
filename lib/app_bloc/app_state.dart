part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class UserInitialState extends AppState {
  final String initialMessage;
  UserInitialState({required this.initialMessage});
}

class UserLoadingState extends AppState {
  UserLoadingState();
}

class UsersLoadedState extends AppState {
  final List<UserModel> list;
  UsersLoadedState({required this.list});
}

class UserLoadedState extends AppState {
  final int user;
  UserLoadedState({required this.user});
}

class UserErrorState extends AppState {
  final String userErrorStateMessage;
  UserErrorState({required this.userErrorStateMessage});
}
