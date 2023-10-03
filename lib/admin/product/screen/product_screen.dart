import 'package:flutter/material.dart';
import 'package:product_management_mobile_application/admin/product/models/Product.dart';
import 'package:product_management_mobile_application/admin/product/presenter/product_presenter.dart';
import 'package:product_management_mobile_application/admin/product/screen/product_detail_screen.dart';
import 'package:product_management_mobile_application/admin/product/views/product_view.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> implements ProductView {
  late ProductPresenter productPresenter;
  bool loading = false;
  List<Product> productList = [];

  int _currentPage = 1;
  int _itemsPerPage = 5;

  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;

  void _loadNextPage() async {
    setState(() {
      _currentPage +=1;
    });
    productPresenter.getAllProduct(_itemsPerPage, _currentPage);
  }

  void _loadMore() async{
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300){
      setState(() {
        _isLoadMoreRunning = true;
      });
    }
  }

  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _loadNextPage();
    productPresenter = ProductPresenter(this);
    productPresenter.getAllProduct(_itemsPerPage,_currentPage);
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_loadMore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          "List Product",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        child: loading == true
            ? const CircularProgressIndicator(
                color: Colors.purple,
              )
            : RefreshIndicator(
                onRefresh: () async {
                  setState(() {
                    _currentPage = 1;
                  });
                  productPresenter.getAllProduct(_itemsPerPage,_currentPage);
                },
                child: ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (BuildContext context, index) {
                      if (index < productList.length) {
                        var product = productList[index];
                        return Container(
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                              color: Colors.deepPurple.withOpacity(.03),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: ListTile(
                            leading: Image.network(
                              "${product.thumbnail ?? ""}",
                              width: 80,
                              height: 80,
                            ),
                            title: Text("${product.title}"),
                            subtitle: Text(
                              "${product.description}",
                              style: TextStyle(color: Colors.black),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                productPresenter.getProductById(product.id!);
                              },
                              icon: Icon(Icons.more_horiz),
                            ),
                          ),
                        );
                      } else if (index == productList.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return null;
                      }
                    }),
              ),
      ),
    );
  }

  @override
  void onError(String message) {
    print("Error : ${message}");
  }

  @override
  void onGetAllProductSuccess(List<Product> list) {
    setState(() {
      if(_currentPage == 1){
        productList = list;
      }else{
        productList.addAll(list);
      }
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
  void onGetProductByIdSuccess(Product product) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailScreen(
            product: product,
          ),
        ));
  }

  static showMessageDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurple,
          ),
        );
      },
    );
  }

  @override
  void onHidingGetProductById() {
    Navigator.pop(context);
  }

  @override
  void onLoadingGetProductById() {
    showMessageDialog(context);
  }
}
