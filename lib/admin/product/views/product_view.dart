import 'package:product_management_mobile_application/admin/product/models/Product.dart';
import 'package:product_management_mobile_application/views/base_views.dart';

abstract interface class ProductView implements BaseView{
  void onGetAllProductSuccess(List<Product>list);
  void onGetProductByIdSuccess(Product product);
  void onLoadingGetProductById();
  void onHidingGetProductById();
}