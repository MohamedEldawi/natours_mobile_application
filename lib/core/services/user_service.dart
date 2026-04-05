import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:natours_application/Features/User/data/models/user.dart';
import 'package:natours_application/core/Helpers/constants.dart';
import 'package:natours_application/core/Helpers/shared_pref_helper.dart';

class UserService {
  UserService._internal();
  static final UserService _instance = UserService._internal();
  factory UserService() => _instance;

  User? _user;
  User? get currentUser => _user;

  void setUserInMemory(User user) {
    _user = user;
  }

  void clearUserFromMemory() {
    _user = null;
  }

  // save user to secure storage and memory
  Future<void> saveUser(User user) async {
    setUserInMemory(user);
    await saveUserToSecureStorage(user);
  }

  Future<void> saveUserToSecureStorage(User user) async {
    await SharedPrefHelper.setSecureString(
      SharedPrefKeys.userName,
      user.name ?? '',
    );
    await SharedPrefHelper.setSecureString(
      SharedPrefKeys.userEmail,
      user.email ?? '',
    );
    await SharedPrefHelper.setSecureString(
      SharedPrefKeys.userPhoto,
      user.photo ?? '',
    );
    await SharedPrefHelper.setSecureString(
      SharedPrefKeys.userRole,
      user.role ?? '',
    );
    await SharedPrefHelper.setSecureString(
      SharedPrefKeys.userId,
      user.id ?? '',
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecureString(SharedPrefKeys.userToken, token);
  }

  Future<bool> hasValidToken() async {
    final token = await SharedPrefHelper.getSecureString(
      SharedPrefKeys.userToken,
    );
    return token.isNotEmpty && !JwtDecoder.isExpired(token);
  }

  Future<void> restoreCachedUserFromSecureStorage() async {
    String name = await SharedPrefHelper.getSecureString(
      SharedPrefKeys.userName,
    );
    String email = await SharedPrefHelper.getSecureString(
      SharedPrefKeys.userEmail,
    );
    String photo = await SharedPrefHelper.getSecureString(
      SharedPrefKeys.userPhoto,
    );
    String role = await SharedPrefHelper.getSecureString(
      SharedPrefKeys.userRole,
    );
    String id = await SharedPrefHelper.getSecureString(SharedPrefKeys.userId);
    final bool hasValidCachedUser =
        id.isNotEmpty && email.isNotEmpty && name.isNotEmpty;
    if (!hasValidCachedUser) {
      clearUserFromMemory();
      return;
    }
    setUserInMemory(
      User(name: name, email: email, photo: photo, role: role, id: id),
    );
  }

  Future<void> clearUserFromSecureStorage() async {
    await SharedPrefHelper.removeSecureData(SharedPrefKeys.userToken);
    await SharedPrefHelper.removeSecureData(SharedPrefKeys.userName);
    await SharedPrefHelper.removeSecureData(SharedPrefKeys.userEmail);
    await SharedPrefHelper.removeSecureData(SharedPrefKeys.userPhoto);
    await SharedPrefHelper.removeSecureData(SharedPrefKeys.userRole);
    await SharedPrefHelper.removeSecureData(SharedPrefKeys.userId);
  }

  // clear user from memory and secure storage
  Future<void> clearUser() async {
    clearUserFromMemory();
    await clearUserFromSecureStorage();
  }
}
