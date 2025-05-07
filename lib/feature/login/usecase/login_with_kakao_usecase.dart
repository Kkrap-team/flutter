import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:krap/core/util/app_logger.dart';

class LoginWithKakaoUsecase {
  Future<String> loginWithKakao() async {
    if (await isKakaoTalkInstalled()) {
      try {
        // 카카오톡 앱 로그인 시도
        AppLogger.e('loginWithKakao(), 앱 로그인');
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        AppLogger.d('++loginWithKakao() accessToken = ${token.accessToken}');
        return token.accessToken;
      } catch (error) {
        AppLogger.e('++loginWithKakao() error = $error, 웹 로그인');
        // 카카오톡 로그인 실패 시 웹 로그인 시도 (선택사항)
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          AppLogger.d('++loginWithKakao() accessToken = ${token.accessToken}');
          return token.accessToken;
        } catch (error) {
          AppLogger.e('++loginWithKakao() error = $error');
          rethrow;
        }
      }
    } else {
      try {
        // 카카오톡 미설치 환경, 바로 웹 로그인 시도
        AppLogger.e('loginWithKakao(), 카카오 미설치 웹 로그인');
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        AppLogger.d('++loginWithKakao() accessToken = ${token.accessToken}');
        return token.accessToken;
      } catch (error) {
        AppLogger.e('++loginWithKakao() error = $error');
        rethrow;
      }
    }
  }
}
