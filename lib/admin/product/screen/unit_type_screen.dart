import 'package:flutter/material.dart';
import 'package:product_management_mobile_application/admin/product/models/Unit_type.dart';
import 'package:product_management_mobile_application/admin/product/presenter/unit_type_presenter.dart';
import 'package:product_management_mobile_application/admin/product/views/unit_tpye_view.dart';

class UnitTypeScreen extends StatefulWidget {
  const UnitTypeScreen({super.key});

  @override
  State<UnitTypeScreen> createState() => _UnitTypeScreenState();
}

class _UnitTypeScreenState extends State<UnitTypeScreen>
    implements UnitTypeView {
  late UnitTypePresenter presenter;
  List<UnitType> list = [];
  bool loading = false;
  @override
  void initState() {
    super.initState();
    presenter = UnitTypePresenter(this);
    presenter.getAllUnitType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Unit Type"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: loading == true
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ListTile(
                    title: Text("${list[index].name}"),
                    trailing: Icon(Icons.more_horiz),
                  ),
                );
              }),
    );
  }

  @override
  void onError(String message) {
    // TODO: implement onError
  }

  @override
  void onGetAllUnitTypeSuccess(List<UnitType> list) {
    setState(() {
      this.list = list;
    });
  }

  @override
  void onHiding() {
    setState(() {
      loading = false;
    });
  }

  @override
  void onLoading() {
    setState(() {
      loading = true;
    });
  }

  @override
  void onLogout() {
    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
  }
}
