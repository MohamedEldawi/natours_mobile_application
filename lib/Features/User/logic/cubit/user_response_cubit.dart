import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natours_application/Features/User/data/repos/user_repo.dart';
import 'package:natours_application/core/Helpers/constants.dart';
import 'package:natours_application/core/networking/api_constants.dart';
import 'package:natours_application/core/networking/api_result.dart';
import 'package:natours_application/core/services/user_service.dart';
import 'user_response_state.dart';

class UserResponseCubit extends Cubit<UserResponseState> {
  final Userrepo userrepo;
  UserResponseCubit(this.userrepo) : super(UserResponseState.initial());
  Future<void> bootstrap() async {
    if (!isLoggedIn) return;
    final cachedUser = UserService().currentUser;
    if (cachedUser != null) {
      emit(UserResponseState.userSuccess(cachedUser));
      refreshUserInBackground();
    } else {
      await loadUser();
    }
  }

  Future<void> loadUserInLoginSuccess() async {
    final cachedUser = UserService().currentUser;
    if (cachedUser != null) {
      emit(UserResponseState.userSuccess(cachedUser));
      refreshUserInBackground();
    } else {
      await loadUser();
    }
  }

  Future<void> loadUser() async {
    emit(UserResponseState.userLoading());
    final response = await userrepo.getUser();
    response.when(
      success: (user) async {
        await UserService().saveUser(user);
        emit(UserResponseState.userSuccess(user));
      },
      failure: (error) async {
        if (error.statusCode == 401) {
          await clearUserWhenNotAuthorized();
          return;
        }
        emit(UserResponseState.userError(error.message));
      },
    );
  }

  Future<void> refreshUserInBackground() async {
    final response = await userrepo.getUser();
    response.when(
      success: (user) async {
        await UserService().saveUser(user);
        emit(UserResponseState.userSuccess(user));
      },
      failure: (error) async {
        if (error.statusCode == 401) {
          await clearUserWhenNotAuthorized();
        }
      },
    );
  }

  Future<void> clearUserWhenNotAuthorized() async {
    await UserService().clearUser();
    isLoggedIn = false;
    emit(
      const UserResponseState.userUnauthorized(
        ApiConstants.invalidTokenMessage,
      ),
    );
  }
}
