import 'package:samuel_martin_c1/models/product.dart';

class StockManager {
  Map<Product, int> products = {};

  bool addProduct(Product p, int stock) {
    return false;
  }

  int getStock(Product p) {
    var stock = products[p];
    if (stock == null) {
      return -1;
    }
    return stock;
  }

  bool modifyStock(Product p, int amount) {
    var stock = products[p];
    if (stock == null) {
      return false;
    }
    if (stock + amount < 0) {
      return false;
    }
    products[p] = stock + amount;
    return true;
  }
}
