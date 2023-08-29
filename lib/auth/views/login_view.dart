import 'package:product_management_mobile_application/auth/models/login_response.dart';

abstract interface class LoginView {
  void onLoading();
  void onHiding();
  void onError( String message);
  void onLoginSuccess(LoginResponse res);
}
