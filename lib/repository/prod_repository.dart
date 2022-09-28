import '../models/review.dart';
import '../network_module/api_path.dart';
import '../network_module/http_clients.dart';
import '../models/product.dart';

class ProductRepository {
  Future<List<Product>?> fetchProductDetails(String userId) async {
    List<Product> loadedProduct = [];

    final Map<String, dynamic> prodResponse =
        await HttpClient.instance.fetchProductData(
      APIPathHelper.getValue(APIPath.fetch_product),
    );
    final favResponse = await HttpClient.instance.fetchProductData(
      APIPathHelper.getValue(APIPath.fetch_fav, userID: userId),
    );
    prodResponse.forEach(
      (prodId, prodData) {
        loadedProduct.add(
          Product.fromJson(
            prodData,
            prodId,
            favResponse == null ? false : favResponse[prodId] ?? false,
          ),
        );
      },
    );
    return loadedProduct;
  }
}

Future<List<SingleReview>?> fetchReview(String userId) async {
  List<SingleReview> loadedReviews = [];

  final Map<String, dynamic> prodResponse =
      await HttpClient.instance.fetchProductData(
    APIPathHelper.getValue(APIPath.fetch_reviews),
  );
  prodResponse.forEach(
    (prodId, revData) {
      loadedReviews.add(
        SingleReview.fromJson(revData),
      );
    },
  );
  return loadedReviews;
}
