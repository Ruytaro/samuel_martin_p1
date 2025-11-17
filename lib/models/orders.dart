import 'package:samuel_martin_c1/models/product.dart';

class Orders {
  Map<Product, int> products = {};
  late DateTime payment;
  late double total;
}
