import 'package:samuel_martin_c1/models/product.dart';

class Order {
  Map<Product, int> products = {};
  late DateTime payment;
  late double total;
}
