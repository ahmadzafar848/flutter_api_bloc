import 'package:bloc/bloc.dart';
import 'package:bloc_api_practice/repos/app_repo.dart';
import 'package:meta/meta.dart';

import '../models/UserModel.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final userRepository = UserRepository();

  AppBloc() : super(UserInitialState(initialMessage: 'No User to Show')) {
    on<FetchUsersEvent>((event, emit) async {
      emit.call(UserLoadingState());
      try {
        List<UserModel> list = await userRepository.fetchUsersData();
        emit.call(UsersLoadedState(list: list));
      } catch (e) {
        emit.call(UserErrorState(userErrorStateMessage: 'User Error'));
      }
    });
  }
}
