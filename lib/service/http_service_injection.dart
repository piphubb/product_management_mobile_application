import 'package:product_management_mobile_application/repository/http_repository.dart';
import 'package:product_management_mobile_application/repository/http_repository_impl.dart';

class HttpServiceInjection{

  static final HttpServiceInjection _instance = HttpServiceInjection._Internal();

  factory HttpServiceInjection(){
    return _instance;
  }
  HttpServiceInjection._Internal();

  HttpRepository get httpRepository => HttpRepositoryImpl();
}