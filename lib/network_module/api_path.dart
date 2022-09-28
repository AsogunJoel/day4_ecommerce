enum APIPath {
  fetch_album,
  fetch_product,
  fetch_fav,
  fetch_orders,
  fetch_reviews,
}

class APIPathHelper {
  static String getValue(APIPath path, {String? userID}) {
    switch (path) {
      case APIPath.fetch_album:
        return "/albums/1";
      case APIPath.fetch_product:
        return "/products.json";
      case APIPath.fetch_fav:
        return "/userFavourite/$userID.json";
      case APIPath.fetch_orders:
        return "/orders/$userID.json";
      case APIPath.fetch_reviews:
        return "/review.json";
      default:
        return "";
    }
  }
}
