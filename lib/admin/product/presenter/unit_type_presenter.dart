import 'package:product_management_mobile_application/admin/product/views/unit_tpye_view.dart';
import 'package:product_management_mobile_application/repository/http_repository.dart';
import 'package:product_management_mobile_application/service/http_service_injection.dart';

class UnitTypePresenter{
  late UnitTypeView view;
  late HttpRepository httpRepository;

  UnitTypePresenter(this.view){
    httpRepository = HttpServiceInjection().httpRepository;
  }

  void getAllUnitType(){
    view.onLoading();
    httpRepository.getAllUnitTypes().then((value){
      view.onHiding();
      if(value.isSuccess == true){
        view.onGetAllUnitTypeSuccess(value.data!);
      }
      if(value.isSuccess == false){
        if(value.code == 401){
          view.onLogout();
        }else{
          view.onError(value.message!);
        }
      }
    });
  }
}