import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natours_application/Features/Profile/data/models/user.dart';

part 'user_response_state.freezed.dart';

@freezed
class UserResponseState with _$UserResponseState {
  const factory UserResponseState.initial() = _Initial;
  const factory UserResponseState.userLoading() = UserLoading;
  const factory UserResponseState.userSuccess(User user) = UserSuccess;
  const factory UserResponseState.userError(String message) = UserError;
  const factory UserResponseState.userUnauthorized(String message) =
      UserUnauthorized;
  const factory UserResponseState.userLoggedOut() = UserLoggedOut;
}
