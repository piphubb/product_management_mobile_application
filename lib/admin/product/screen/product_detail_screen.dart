import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:product_management_mobile_application/admin/product/models/Product.dart';
import 'package:product_management_mobile_application/admin/product/presenter/product_presenter.dart';
import 'package:product_management_mobile_application/admin/product/views/product_view.dart';
import 'package:product_management_mobile_application/admin/product/widget/custom_list_title.dart';

class ProductDetailScreen extends StatefulWidget {
  Product product;
  ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    implements ProductView {
  Product product = Product();
  late ProductPresenter presenter;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    presenter = ProductPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Product Detail",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          presenter.getProductById(product.id!);
        },
        child: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 250.0),
              items: product.images!.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Image.network(
                          "${i}",
                          fit: BoxFit.contain,
                          height: 250,
                        ));
                  },
                );
              }).toList(),
            ),
            CustomListTitle(
              title: "Product Name : ",
              trailing: "${product.title}",
            ),
            CustomListTitle(
              title: "Product Price : ",
              trailing: "\$ ${product.price!.toStringAsFixed(2)}",
              color: Colors.red,
            ),
            ListTile(
              title: Text("Product Discount : "),
              trailing: Text(
                "${product.discountPercentage!.toStringAsFixed(1)} %",
                style: TextStyle(fontSize: 18),
              ),
            ),
            CustomListTitle(
              title: "Product Rating : ",
              trailing: "\$ ${product.rating}",
            ),
            ListTile(
              title: Text("Product Stock : "),
              trailing: Text("${product.stock}"),
            ),
            ListTile(
              title: Text("Product Brand : "),
              trailing: Text("${product.brand}"),
            ),
            ListTile(
              title: Text("Category : "),
              trailing: Text("${product.category}"),
            ),
            Column(
              children: [
                CustomListTitle(
                  title: "Description : ",
                  trailing: "",
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "${product.description}",
                    maxLines: 1000,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void onError(String message) {
    // TODO: implement onError
  }

  @override
  void onGetAllProductSuccess(List<Product> list) {
    // TODO: implement onGetAllProductSuccess
  }

  @override
  void onGetProductByIdSuccess(Product product) {
    setState(() {
      this.product = product;
    });
  }

  @override
  void onHiding() {
    // TODO: implement onHiding
  }

  @override
  void onHidingGetProductById() {
    Navigator.pop(context);
  }

  @override
  void onLoading() {
    // TODO: implement onLoading
  }

  @override
  void onLoadingGetProductById() {
    showMessageDialog(context);
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
}
