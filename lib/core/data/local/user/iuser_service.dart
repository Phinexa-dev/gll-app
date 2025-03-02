import 'model/user_model.dart';

abstract interface class IUserService {

  Future<bool> isUserLoggedIn();

  Future<UserModel?> getUser();

  Future<void> saveUser(UserModel user);

  Future<void> editUser(UserModel? user);

  Future<void> clearUser();
}