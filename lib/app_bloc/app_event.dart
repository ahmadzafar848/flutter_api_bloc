part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class FetchUserEvent extends AppEvent {
  final int id;
  FetchUserEvent(this.id);
}

class FetchUsersEvent extends AppEvent {}
