import 'dart:convert';

import 'package:day_4/constants/key.dart';
import 'package:day_4/network_module/api_response.dart';
import 'package:day_4/repository/prod_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

import '../models/review.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product with ChangeNotifier {
  final String id;
  final List<String> category;
  final String subcategory;
  final String title;
  final String shortName;
  final String image;
  final String description;
  final int price;
  final num shippingFee;
  final String seller;
  final List<SingleReview>? reviews;
  String? specification;
  String? keyFeatures;
  List<String>? variation;
  List<String>? otherImages;
  List<String>? colorImages;
  int? oldPrice;
  double? totalrating;
  bool isFavourite;
  bool isRecommended;
  bool isFlashSale;
  bool isTrending;
  bool isFreeDelivery;

  Product({
    required this.id,
    required this.category,
    required this.subcategory,
    required this.title,
    required this.shortName,
    required this.image,
    required this.description,
    this.reviews,
    required this.price,
    required this.shippingFee,
    required this.seller,
    this.variation,
    this.specification,
    this.keyFeatures,
    this.totalrating = 0,
    this.otherImages,
    this.colorImages,
    this.oldPrice,
    this.isFavourite = false,
    this.isRecommended = false,
    this.isFlashSale = false,
    this.isTrending = false,
    this.isFreeDelivery = false,
  });

  factory Product.fromJson(Map<String, dynamic> data, String id, fav) =>
      _$ProductFromJson(data, id, fav);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Future<bool> toggleFavourite(String token, String userId) async {
    final oldStatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    final url =
        Uri.parse('$urlfromenv/userFavourite/$userId/$id.json?auth=$token');
    try {
      final response = await http.put(
        url,
        body: json.encode(
          isFavourite,
        ),
      );
      if (response.statusCode >= 400) {
        isFavourite = oldStatus;
        notifyListeners();
      }
    } catch (error) {
      isFavourite = oldStatus;
      notifyListeners();
    }
    return isFavourite;
  }

  double prodrating(List<SingleReview> rate) {
    return rate.map((m) => m.rating).reduce((a, b) => a + b) / rate.length;
  }

  int addQuantity(int quant) {
    return quant + 1;
  }

  num percentageoff(num OldP, num NewP) {
    final ff = (oldPrice! - NewP);
    final pp = (ff / oldPrice!);
    final tt = pp * 100;
    return tt;
  }

  nairaPrice(price) {
    return '₦${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }
}

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
    notifyListeners();
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
      notifyListeners();
    }
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
