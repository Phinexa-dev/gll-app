import '../../../../common/dtos/refresh_token_response.dart';

abstract interface class ITokenService {

  Future<bool> hasToken();

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> saveTokens(String accessToken, String refreshToken);

  Future<RefreshTokenResponse> refreshToken(String? refreshToken);

  Future<void> clearTokens();
}