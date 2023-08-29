import 'package:product_management_mobile_application/auth/models/login_request.dart';
import 'package:product_management_mobile_application/auth/models/login_response.dart';
import 'package:product_management_mobile_application/models/http_base_response.dart';

abstract interface class HttpRepository{
  Future<HttpBaseResponse<LoginResponse>> login(LoginRequest req);
}