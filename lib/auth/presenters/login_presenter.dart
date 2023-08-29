import 'package:product_management_mobile_application/auth/models/login_request.dart';
import 'package:product_management_mobile_application/auth/views/login_view.dart';
import 'package:product_management_mobile_application/repository/http_repository.dart';
import 'package:product_management_mobile_application/service/http_service_injection.dart';

class LoginPresenter{
  late LoginView view;
  late HttpRepository httpRepository;
  LoginPresenter(this.view){
    httpRepository = HttpServiceInjection().httpRepository;
  }
  void login(LoginRequest req){
    view.onLoading();
    httpRepository.login(req).then((value){
      view.onHiding();
      if(value.isSuccess == true){
        view.onLoginSuccess(value.data!);
      }else{
        view.onError(value.message!);
      }
    });
  }
}