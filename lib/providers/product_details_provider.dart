import 'package:flutter/material.dart';
import 'package:dummyShop/data/model/product_model.dart';
import 'package:dummyShop/data/model/product_model_impl.dart';
import 'package:dummyShop/data/vos/product_vo.dart';

class ProductDetailProvider extends ChangeNotifier {
  bool _isLoading = true;
  bool _isDisposed = false;
  int currentIndex = 0;
  PageController pageController = PageController();
  final ProductModel _productModel = ProductModelImpl();
  ProductsVO? productDetails;

  bool get isLoading => _isLoading;

  ProductDetailProvider(int productId) {
    fetchProductDetails(productId);
  }
  set selectedIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  String discountPrice(double originalPrice, double discountPercentage) {
    double discountAmount = originalPrice * (discountPercentage / 100);
    double discountPrice = originalPrice - discountAmount.toInt();
    return discountPrice.toStringAsFixed(2);
  }

  Future<void> fetchProductDetails(int productId) async {
    if (_isDisposed) return;

    _isLoading = true;
    notifyListeners();

    try {
      _productModel.fetchProductDetailVO(productId);
      _productModel.getProductsDetailFromDatabase(productId).listen((event) {
        if (!_isDisposed) {
          productDetails = event;
          _isLoading = false;
          notifyListeners();
        }
      });
    } catch (e) {
      throw Exception('Failed to fetch product details: $e');
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    pageController.dispose();
    super.dispose();
  }
}
