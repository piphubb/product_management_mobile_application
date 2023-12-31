import 'package:product_management_mobile_application/admin/product/views/product_view.dart';
import 'package:product_management_mobile_application/repository/http_repository.dart';
import 'package:product_management_mobile_application/service/http_service_injection.dart';

class ProductPresenter{
  late ProductView view;
  late HttpRepository httpRepository;

  ProductPresenter(this.view){
    httpRepository = HttpServiceInjection().httpRepository;
  }

  void getAllProduct(int limit, int page){
    view.onLoading();
    httpRepository.getAllProduct(limit, page).then((value){
      view.onHiding();
      if(value.isSuccess == true){
        view.onGetAllProductSuccess(value.data!);
      }else{
        view.onError(value.message!);
      }
    });
  }
  void getProductById(int id){
    view.onLoadingGetProductById();
    httpRepository.getProductById(id).then((value){
      view.onHidingGetProductById();
      if(value.isSuccess == true){
        view.onGetProductByIdSuccess(value.data!);
      }else{
        view.onError(value.message!);
      }
    });
  }
}
