import 'dart:convert';

import 'package:day_4/constants/key.dart';
import 'package:day_4/network_module/api_response.dart';
import 'package:day_4/models/product.dart';
import 'package:day_4/repository/prod_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  final String authToken;
  final String userId;
  List<Product> _PRODUCTS = [];

  Products(this.authToken, this.userId, this._PRODUCTS) {
    _albumRepository = ProductRepository();
    fetchAndSetProduct();
  }

  late ProductRepository _albumRepository;

  late ApiResponse<List<Product>> _product;

  ApiResponse<List<Product>> get product => _product;

  Future<void> fetchAndSetProduct() async {
    _product = ApiResponse.loading('loading... ');
    try {
      List<Product>? products =
          await _albumRepository.fetchProductDetails(userId);
      _product = ApiResponse.completed(products);
      _PRODUCTS = products!;
      notifyListeners();
    } catch (e) {
      _product = ApiResponse.error(
        e.toString(),
      );
    }
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    final url = Uri.parse(
      '$urlfromenv/products.json',
    );
    try {
      final response = await http.post(
        url,
        body: json.encode(
          product.toJson(),
        ),
      );
      final prod = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        image: product.image,
        description: product.description,
        price: product.price,
        category: product.category,
        oldPrice: product.oldPrice,
        variation: product.variation,
        seller: product.seller,
        shippingFee: product.shippingFee,
        shortName: product.shortName,
        subcategory: product.subcategory,
        otherImages: product.otherImages,
        specification: product.specification,
        keyFeatures: product.keyFeatures,
      );
      _PRODUCTS.insert(0, prod);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  List<Product> get PRODUCTS {
    return [..._PRODUCTS];
  }

  List<Product> get favourite {
    return [..._PRODUCTS]
        .where(
          (prod) => prod.isFavourite == true,
        )
        .toList();
  }

  List<Product> get electronics {
    return [..._PRODUCTS]
        .where(
          (prod) => prod.category.contains('Electronics'),
        )
        .toList();
  }

  List<Product> get automobile {
    return [..._PRODUCTS]
        .where(
          (prod) => prod.category.contains('Auto-Mobile'),
        )
        .toList();
  }

  bool gridview = true;
  void toggleGridView() {
    gridview = !gridview;
    notifyListeners();
  }

  void removeItem(id) {
    PRODUCTS.removeWhere(
      (element) => id == element.id,
    );
    notifyListeners();
  }

  void removeFavItem() {
    favourite.clear();
    notifyListeners();
  }

  bool dropDown = false;
  void dropDownChange() {
    dropDown = !dropDown;
    notifyListeners();
  }
}
