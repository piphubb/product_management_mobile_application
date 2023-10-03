import 'dart:convert';

import 'package:product_management_mobile_application/admin/product/models/Product.dart';
import 'package:product_management_mobile_application/auth/models/login_request.dart';
import 'package:product_management_mobile_application/auth/models/login_response.dart';
import 'package:product_management_mobile_application/models/http_base_response.dart';
import 'package:product_management_mobile_application/repository/http_repository.dart';
import 'package:product_management_mobile_application/service/api.dart';
import 'package:http/http.dart' as httpClient;

class HttpRepositoryImpl extends Api implements HttpRepository {
  @override
  Future<HttpBaseResponse<LoginResponse>> login(LoginRequest req) async {
    try {
      var url = Uri.parse(loginUrl);
      var response = await httpClient.post(url, body: req.toJson());
      Map map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return HttpBaseResponse(
            code: 200,
            isSuccess: true,
            message: "Login Success",
            data: LoginResponse.fromJson(map));
      } else {
        return HttpBaseResponse(
            code: 400, isSuccess: false, message: map['message'], data: null);
      }
    } catch (e) {
      return HttpBaseResponse(
          code: 500, isSuccess: false, message: e.toString(), data: null);
    }
  }

  @override
  Future<HttpBaseResponse<List<Product>>> getAllProduct(int limit, int page) async {
    List<Product> list = [];
    try {
      var url = Uri.parse(getProductUrl + "?limit=${limit}&skip=${page}");
      var response = await httpClient.get(url);
      final Map<String, dynamic> map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        map["products"].forEach((e) {
          Product product = Product.fromJson(e);
          list.add(product);
        });
        return HttpBaseResponse(
            code: 200,
            isSuccess: true,
            message: "Get Data Success",
            data: list);
      } else {
        return HttpBaseResponse(
            code: 400, isSuccess: false, message: "Get Data Error", data: null);
      }
    } catch (e) {
      return HttpBaseResponse(
          code: 500, isSuccess: false, message: e.toString(), data: null);
    }
  }

  @override
  Future<HttpBaseResponse<Product>> getProductById(int id) async {
    try {
      var url = Uri.parse(getProductUrlByIdUrl + id.toString());
      var res = await httpClient.get(url).timeout(
            Duration(seconds: 120),
          );
      final Map map = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return HttpBaseResponse(
            code: 200,
            isSuccess: true,
            message: "Get Product by Id Success",
            data: Product.fromJson(map));
      } else {
        return HttpBaseResponse(
            code: 400, isSuccess: false, message: "Get Data Error", data: null);
      }
    } catch (e) {
      return HttpBaseResponse(
          code: 500, isSuccess: false, message: e.toString(), data: null);
    }
  }
}
