import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gll/core/data/local/secure_storage/Isecure_storage.dart';
import '../../local/secure_storage/secure_storage.dart';
import '../../local/secure_storage/secure_storage_const.dart';
import '../../remote/network_service.dart';
import '../../remote/token/itoken_service.dart';
import '../../remote/token/token_service.dart';
import 'iuser_service.dart';
import 'model/user_model.dart';

final userServiceProvider = Provider<IUserService>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  final dio = ref.watch(networkServiceProvider);
  final tokenService = ref.watch(tokenServiceProvider(dio));
  return UserService(secureStorage, tokenService);
});

final userProvider = AutoDisposeFutureProvider<UserModel?>((ref) async {
  final userService = ref.watch(userServiceProvider);
  return await userService.getUser();
});

class UserService implements IUserService {
  final ISecureStorage _secureStorage;
  final ITokenService _tokenService;

  UserService(this._secureStorage, this._tokenService);

  @override
  Future<bool> isUserLoggedIn() async {
    final hasToken = await _tokenService.hasToken();
    final user = await getUser();

    return hasToken && user != null;
  }

  @override
  Future<void> clearUser() {
    return Future.wait([
      _secureStorage.delete(key: userId),
      _secureStorage.delete(key: userName),
      _secureStorage.delete(key: userEmail),
    ]);
  }

  @override
  Future<UserModel?> getUser() async {
    final id = await _secureStorage.read(key: userId);
    final name = await _secureStorage.read(key: userName);
    final email = await _secureStorage.read(key: userEmail);

    if (id != null && name != null && email != null && int.tryParse(id) != null) {
      return UserModel(
        id: int.parse(id),
        fullName: name,
        email: email,
      );
    }
    return null;  //  TODO: log out handling
  }

  @override
  Future<void> editUser(UserModel? user) async {
    if (user != null) {
      await _secureStorage.write(key: userName, value: user.fullName);
      await _secureStorage.write(key: userEmail, value: user.email);
    }
  }

  @override
  Future<void> saveUser(UserModel user) {
    return Future.wait([
      _secureStorage.write(key: userId, value: user.id.toString()),
      _secureStorage.write(key: userName, value: user.fullName),
      _secureStorage.write(key: userEmail, value: user.email),
    ]);
  }
}