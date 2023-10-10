import 'package:product_management_mobile_application/admin/product/models/Product.dart';
import 'package:product_management_mobile_application/admin/product/models/Unit_type.dart';
import 'package:product_management_mobile_application/auth/models/login_req.dart';
import 'package:product_management_mobile_application/auth/models/login_res.dart';
import 'package:product_management_mobile_application/models/http_base_response.dart';

abstract interface class HttpRepository{
  Future<HttpBaseResponse<LoginRes>> login(LoginReq req);
  Future<HttpBaseResponse<List<Product>>> getAllProduct(int limit,int page);
  Future<HttpBaseResponse<Product>> getProductById(int id);
  Future<HttpBaseResponse<List<UnitType>>> getAllUnitTypes();
}