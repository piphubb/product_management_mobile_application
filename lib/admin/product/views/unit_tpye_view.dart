import 'package:product_management_mobile_application/admin/product/models/Unit_type.dart';
import 'package:product_management_mobile_application/views/base_views.dart';

abstract interface class UnitTypeView implements BaseView{
  void onGetAllUnitTypeSuccess(List<UnitType> list);
  void onLogout();
}